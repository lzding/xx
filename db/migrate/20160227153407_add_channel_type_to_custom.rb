class AddChannelTypeToCustom < ActiveRecord::Migration
  def change
    add_column :customs, :channel_type, :integer, null: false
  end
end
