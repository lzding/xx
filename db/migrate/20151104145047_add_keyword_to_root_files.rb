class AddKeywordToRootFiles < ActiveRecord::Migration
  def change
    add_column :root_files, :keyword, :string
    add_index :root_files, :keyword
  end
end
