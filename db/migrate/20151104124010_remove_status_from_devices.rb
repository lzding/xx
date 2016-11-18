class RemoveStatusFromDevices < ActiveRecord::Migration
  def change
    remove_index :devices, :status
    remove_column :devices, :status, :integer
  end
end
