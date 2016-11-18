class AddChannelTypeToGlobals < ActiveRecord::Migration
  def change
    add_column :globals, :channel_type, :integer, null:false
  end
end
