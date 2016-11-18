class GameDetail < ActiveRecord::Base
  self.table_name= 'game_detail'

  belongs_to :game
end
