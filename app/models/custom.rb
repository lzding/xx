class Custom < ActiveRecord::Base
  KEY = 'ZDg3NGU3MGJhZDJhYzdlMQ=='
  validates_presence_of :name, :expire_date
  validates :name, uniqueness: { message: "此名称的渠道已经存在！" }
  before_validation :generate_token

  has_many :root_logs

  scope :enabled, ->{where('status = ?', true)}
  scope :disabled, ->{where('status = ?', false)}

  after_commit :invalidate_caches


  def self.get content
    Rails.cache.fetch "custom:#{content}",:expire_in => 1.day do
      params = Cipher.aes_decrypt(KEY, content).split(';')
      cs = Custom.where("status = 1 and name = ? and expire_date = ?",params[0],params[1].to_time).enabled
      cs.first
    end
  end

  def self.valid_source? content
    get(content).present?
  end

  def channel_label
    ChannelType.find(channel_type).try(:name) rescue nil
  end

  private
  def generate_token
    self.name.downcase!
    self.token = Cipher.aes_encrypt(KEY,"#{self.name};#{self.expire_date.to_s}")
  end

  def invalidate_caches
    #此处需要优化策略
    Rails.cache.clear
  end

end
