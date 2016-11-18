class AddCustomIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :custom_id, :integer
    add_index :devices, :custom_id
  end
end
