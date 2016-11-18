class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :linuxversion
      t.string :imei
      t.string :android_id
      t.string :mac_addr
      t.string :mem_total

      t.timestamps null: false
    end
  end
end
