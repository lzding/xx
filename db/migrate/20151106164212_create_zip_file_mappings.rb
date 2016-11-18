class CreateZipFileMappings < ActiveRecord::Migration
  def change
    create_table :zip_file_mappings do |t|
      t.string :root_file_md5
      t.integer :root_file_id

      t.timestamps null: false
    end
    add_index :zip_file_mappings, :root_file_id
    add_index :zip_file_mappings, :root_file_md5

  end
end
