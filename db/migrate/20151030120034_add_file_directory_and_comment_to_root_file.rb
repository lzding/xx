class AddFileDirectoryAndCommentToRootFile < ActiveRecord::Migration
  def change
    add_column :root_files, :file_directory, :string
    add_column :root_files, :comment, :string
  end
end
