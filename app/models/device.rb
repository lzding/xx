class Device < ActiveRecord::Base
  #status 0初始化 -1失败 1成功
  has_one :prop,  dependent: :destroy
  has_one :cpuinfo,  dependent: :destroy
  has_one :gle,  dependent: :destroy

  def self.by_android_id android_id
    Device.where(android_id: android_id).pluk(:cpu_type).first rescue ''
  end
  has_many :root_logs
end