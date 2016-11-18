class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :name
      t.string :file
      t.integer :category
      t.integer :sdk_api_version
      t.string :file_hex
      t.string :file_directory
      t.boolean :status

      t.timestamps null: false
    end
  end
end
