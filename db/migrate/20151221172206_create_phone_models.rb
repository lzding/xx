class CreatePhoneModels < ActiveRecord::Migration
  def change
    create_table :phone_models do |t|
      t.string :ro_product_brand
      t.string :ro_product_model
      t.string :ro_product_name
      t.string :ro_build_version_release
      t.string :ro_build_version_sdk
      t.string :ro_build_date_utc
      t.string :ro_build_date
      t.string :ro_board_platform
      t.string :ro_hardware
      t.string :ro_product_cpu_abi
      t.string :proc_version
      t.string :proc_meminfo
      t.string :proc_cpuinfo

      t.timestamps null: false
    end
  end
end
