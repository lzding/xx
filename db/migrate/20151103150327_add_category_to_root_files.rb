class AddCategoryToRootFiles < ActiveRecord::Migration
  def change
    add_column :root_files, :category, :integer
    add_index :root_files, :category
  end
end
