class CreateGlobals < ActiveRecord::Migration
  def change
    create_table :globals do |t|
      t.string :name
      t.string :file
      t.boolean :status, null: false, default: true

      t.timestamps null: false
    end
  end
end
