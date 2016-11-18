class AddSourceToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :source, :integer
  end
end
