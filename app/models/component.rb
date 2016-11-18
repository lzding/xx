class Component < ActiveRecord::Base
  #"辅助工具" => -1,
  CATEGORIES = {"精确匹配" => 0,'通用匹配' =>1,
                'RO-通用匹配' => 2 , 'RO-精准匹配' => 3, '扩展方案1' => 4 }
  PIES = {'非PIE 方案' => 20,'PIE方案' => 21}

  scope :enabled, ->{where('status = ?', true)}
  scope :disabled, ->{where('status = ?', false)}
  scope :pie_scope, ->(sdk_api_version) { where("#{if sdk_api_version.to_s.to_i >= 21
                                                     'sdk_api_version >= 21'
                                                   else
                                                     'sdk_api_version < 21'
                                                   end}") }
  mount_uploader :file, ComponentFileUploader


  def self.component category, sdkv
    Component.where("category=?", category).enabled.pie_scope(sdkv).first
  end


  before_save :set_md5

  private
  def set_md5
    self.file_hex = file.md5
    self.file_directory ||= Time.now.strftime('%Y%m%d')
  end

end
