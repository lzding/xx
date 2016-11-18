class AddStatusToRootFiles < ActiveRecord::Migration
  def change
    add_column :root_files, :status, :boolean, null: false, default: true
    add_index :root_files, :status
  end
end
