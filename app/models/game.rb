class Game < ActiveRecord::Base
  self.table_name= 'game'
  belongs_to :company
  has_many :game_images, dependent: :destroy
  has_one :game_detail,  dependent: :destroy
  mount_uploader :picture, ImageUploader
  mount_uploader :icon, ImageUploader

  accepts_nested_attributes_for :game_detail
  accepts_nested_attributes_for :game_images

  before_create :set_createtime
  before_save :set_updatetime


  def company_name
    company.title if company.present?
  end
  private
  def set_createtime
    self.createtime = Time.now
  end

  def set_updatetime
    self.updatetime = Time.now
  end
end
