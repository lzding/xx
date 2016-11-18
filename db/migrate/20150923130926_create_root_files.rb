class CreateRootFiles < ActiveRecord::Migration
  def change
    create_table :root_files do |t|
      t.string :file
      t.string :source_name, unique: true
      t.string :file_hex
      t.integer :sort_num

      t.timestamps null: false
    end
      add_index :root_files, :source_name
      add_index :root_files, :file_hex
  end
end
