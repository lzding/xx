class Phone < ActiveRecord::Base
  paginates_per 50
  validates_presence_of :vendor, :product_model, :linux_version, :build_date, :root_file
  belongs_to :root_file
  has_many :phone_params,  dependent: :destroy

  before_save :set_missed_attr
  default_scope{ order('count DESC')}

  #TODOS: Cache need
  def self.root_tools product,vendor,build_version,build_date,ro_utc_date,android_version,category,keyword,sdk_version
    @sdk_version = sdk_version.to_s.to_i
    @category = category
    root_files = case category
                   when 0
                     excatly_solution(product,vendor,build_version,build_date)
                   when 1
                     general_solution
                   when 2
                     romaster_solution
                   when 3
                     rfs =  []

                     if keyword.present?
                       rfs = excatly_solution(product,vendor,build_version,build_date)
                     end

                     if rfs.blank?
                       rfs = ro_exactly(keyword)
                     end

                     rfs
                   when 4
                     extend_one
                   else
                     []
                 end
  end


  private




  #TODOS: Cache need
  def self.extend_one
    rs = RootFile.where('category = 4').enabled.pie_scope(@sdk_version)
  end

  #TODOS: Cache need
  def self.ro_exactly(keyword)
      if keyword.present?
            rs = RootFile.where('category = 3 and keyword = ? ',keyword).enabled.pie_scope(@sdk_version)
            # shua_su + rs
      else
        []
      end
  end

  def self.general_tools
    Rails.cache.fetch "root_file:general_tools",:expire_in => 1.day do
      RootFile.where('keyword = "general_tools"').enabled.pie_scope(@sdk_version)
    end

  end
  def self.shua_su
    Rails.cache.fetch "root_file:ro_tools",:expire_in => 1.day do
      RootFile.where('keyword = "ro_tools"').enabled.pie_scope(@sdk_version)
    end
  end

  #TODOS: Cache need
  def self.excatly_solution product,vendor,build_version,build_date
    root_files = RootFile.joins(:phones).where('phones.vendor = ?', vendor).where('phones.product_model = ?', product).
        where('phones.linux_version = ?', build_version).
        where('phones.build_date = ?',  build_date).order('phones.count desc').enabled.pie_scope(@sdk_version).uniq
    return [] if root_files.blank?
    # ros = root_files.select { |rf| rf.category && rf.category > 1}
    # ros.compact! if ros
    # if ros.blank?
    #   general_tools + root_files
    # else
    #   shua_su + root_files
    # end
    root_files
  end

  #TODOS: Cache need
  def self.general_solution
    # general_tools + RootFile.where('category = 1').enabled.pie_scope(@sdk_version)
    RootFile.where('category = 1').enabled.pie_scope(@sdk_version)
  end
  #TODOS: Cache need
  def self.romaster_solution
    # shua_su + RootFile.where('category = 2').enabled.pie_scope(@sdk_version)
    RootFile.where('category = 2').enabled.pie_scope(@sdk_version)
  end

  # 小于2014-7 futex
  # 小于2014-6.1 putuser
  # 小于2015-5.6 pingpong
  # def self.parse_by_ro_utc_date ro_utc_date, android_version
  #   av = android_version.split('.')[0]
  #   version = [av[0],av[1]].join('.').to_f
  #   if ro_utc_date < 1401552000 and version <= 4.3 and version >= 4.0
  #     [RootFile.find_by_source_name('putuser')]
  #   elsif ro_utc_date <1391212800
  #     [RootFile.find_by_source_name('putuser')]
  #   elsif ro_utc_date < 1404172800
  #     [RootFile.find_by_source_name('futex')]
  #   else
  #     []
  #   end
  # end

  def set_missed_attr
    if self.new_record?
      self.count = 0
    end

  end
end
