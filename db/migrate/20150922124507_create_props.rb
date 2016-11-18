class CreateProps < ActiveRecord::Migration
  def change
    create_table :props do |t|
      t.string :ro_serialno
      t.string :persist_sys_country
      t.string :ro_product_name
      t.string :ro_build_date
      t.string :ro_build_version_sdk
      t.string :persist_sys_timezone
      t.string :ro_product_brand
      t.string :ro_build_description
      t.string :ro_build_version_release
      t.string :ro_product_model
      t.string :persist_sys_language
      t.string :ro_btconfig_vendor
      t.integer :ro_build_date_utc    , :limit => 8
      t.integer :ro_runtime_firstboot , :limit => 8
      t.string :ro_boot_cpuid
      t.string :ro_build_fingerprint
      t.string :persist_sys_dalvik_vm_lib
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
