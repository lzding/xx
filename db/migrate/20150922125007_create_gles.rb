class CreateGles < ActiveRecord::Migration
  def change
    create_table :gles do |t|
      t.string :extensions
      t.string :version
      t.string :renderer
      t.string :vendor
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
