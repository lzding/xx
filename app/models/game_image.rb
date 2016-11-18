class GameImage < ActiveRecord::Base
  self.table_name= 'game_detail_pic'
  belongs_to :game

  mount_uploader :picture, ImageUploader
end
