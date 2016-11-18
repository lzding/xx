class GameType < ActiveRecord::Base
  self.table_name = 'game_type'
  mount_uploader :picture, ImageUploader

end
