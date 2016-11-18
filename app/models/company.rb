class Company < ActiveRecord::Base
  self.table_name= 'company'
  mount_uploader :picture, ImageUploader
  has_many :games, class: Game
end
