class CreateCpuinfos < ActiveRecord::Migration
  def change
    create_table :cpuinfos do |t|
      t.string :revision
      t.string :modelname
      t.string :cpuimplementer
      t.string :hardware
      t.string :cpurevision
      t.string :cpupart
      t.string :cpuarchitecture
      t.string :features
      t.string :cpuvariant
      t.string :serial
      t.string :processorcnt
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
