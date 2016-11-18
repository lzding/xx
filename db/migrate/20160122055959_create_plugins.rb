class CreatePlugins < ActiveRecord::Migration
  def change
    create_table :plugins do |t|
      t.string :file_path
      t.integer :version
      t.string :pkg_name
      t.string :file_name

      t.timestamps null: false
    end
  end
end
