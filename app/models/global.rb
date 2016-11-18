class Global < ActiveRecord::Base
  validates_presence_of :name
  #TODOS: 重复代码,如何提取重构
  scope :enabled, ->{where('status = ?', true)}
  scope :disabled, ->{where('status = ?', false)}
  mount_uploader :file, ComponentFileUploader
  scope :pie_scope, ->(sdk_api_version) { where("#{if sdk_api_version.to_s.to_i >= 21
                                                     'sdk_api_version >= 21'
                                                   else
                                                     'sdk_api_version < 21'
                                                   end}") }
  scope :channel_type, ->(ct){where('channel_type = ?',ct)}


  #TODOS: 缓存更新策略。更新就要更新缓存

  def file_directory
    # Time.now.strftime('%Y%m%d')
    'files'
  end

  def channel_label
    ChannelType.find(channel_type).try(:name)
  end


  def self.validate_files sdk_version, channel_type
    self.enabled.pie_scope(sdk_version).channel_type(channel_type).first rescue nil || Global.new
  end

end
