class AddBuildVersionAndBuildDateAndRoUtcDateAndProductAndVendorToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :build_version, :string
    add_column :devices, :build_date, :string
    add_column :devices, :ro_utc_date, :string
    add_column :devices, :product, :string
    add_column :devices, :vendor, :string
  end
end
