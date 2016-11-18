class RootFile < ActiveRecord::Base
  has_many :phones
  has_many :zip_file_mappings, dependent: :destroy
  #"辅助工具" => -1,
  CATEGORIES = {"精确匹配" => 0,'通用匹配' =>1,
                'RO-通用匹配' => 2 , 'RO-精准匹配' => 3, '扩展方案1' => 4 }
  PIES = {'非PIE 方案' => 20,'PIE方案' => 21}
  validates_presence_of :file, :category
  # validates :source_name, uniqueness: { message: "方案名称不能重复！" }
  # validates :file, uniqueness: { message: "已经存在此方案" }
  scope :enabled, ->{where('status = ?', true)}
  scope :disabled, ->{where('status = ?', false)}
  scope :pie_scope, ->(sdk_api_version) { where("#{if sdk_api_version >= 21
                                                     'sdk_api_version >= 21'
                                                   else
                                                     'sdk_api_version < 21'
                                                   end}") }
  mount_uploader :file, RootFileUploader
  before_save :set_md5
  after_save :update_zip_file
  default_scope{ order('sort_num ASC')}
  scope :zip_files, ->{ where('category = 1').order('sort_num ASC') }


  after_commit :invalidate_caches


  def initialize params = {}
    super(params)
  end

  def component
    Component.where("category=?", self.category).enabled.pie_scope(self.sdk_api_version)
  end


  def to_json
    {file: self.file.to_s, params: self.execute_params,category: self.category,
     tools: self.tool_name.to_s.split(','), order: self.sort_num, file_hex:self.file_hex,component: component.try(:file).try(:to_s) }
  end


  private
  def set_md5
    @file_changed = file_changed?
    if file.present? && file_changed?
      @tmp_dir = Rails.root.join('app','assets','temp').to_s
      @black_list = ['.','..']
      self.file_hex = file.md5
      self.file_directory ||= date_path
      self.keyword = self.keyword.downcase
    end
  end

  def date_path
    Time.now.strftime('%Y%m%d')
  end

  def save_file file, data
    File.open(file,'wb') do |f|
      f.write(data)
    end
  end

  def extract_file_to_tmp
    if File.exist? @tmp_dir
      Dir.foreach(@tmp_dir) do |file|
        puts File.delete @tmp_dir+'/'+ file unless @black_list.include? file
      end
    else
      Dir.mkdir @tmp_dir
    end
    file_names = []
    Zip::File.open(file.current_path) do |zip_file|
      zip_file.each do |entry|
        content = entry.get_input_stream.read
        new_name =  Digest::MD5.hexdigest(content)
        # if Tool.enabled_file_names.include?(entry.name.downcase)
        #   new_name = entry.name
        #   file_names << entry.name.downcase
        # end
        new_name = new_name + '-pie' if entry.name.downcase.end_with? '-pie'
         if zip_file.count > 1 && entry.name.start_with?('_')
          new_name = '_' + new_name
         end
        create_zip_file(new_name)
        save_file @tmp_dir+'/'+ new_name, content
      end
    end
    tool_name_string =  file_names.join(',')
    self.update_column(:tool_name, tool_name_string)
  end


  def zip_files dest
    File.delete dest if File.exist? dest
    input_filenames = Dir.entries(@tmp_dir) - @black_list
    Zip::File.open(dest, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, @tmp_dir + '/' + filename)
      end
    end
  end

  def update_zip_file
    if @file_changed
      zip_file_mappings.destroy_all
      if file.current_path.end_with?('.zip')
        extract_file_to_tmp
        zip_files(file.current_path)
        File.chmod(0666,file.current_path)
      else
        create_zip_file(file.filename)
      end
    end
  end

  def create_zip_file(file_md5)
    ZipFileMapping.create!(root_file_md5: file_md5,root_file_id:self.id)
  end


  def invalidate_caches
    Rails.cache.delete("root_file:general_tools") if self.keyword.downcase == 'general_tools'
    Rails.cache.delete("root_file:ro_tools") if self.keyword.downcase == 'ro_tools'
  end


end

