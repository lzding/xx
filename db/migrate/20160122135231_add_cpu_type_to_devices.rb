class AddCpuTypeToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :cpu_type, :string, null: false, default: '32bit'
  end
end
