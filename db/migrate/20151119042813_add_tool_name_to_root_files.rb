class AddToolNameToRootFiles < ActiveRecord::Migration
  def change
    add_column :root_files, :tool_name, :string
  end
end
