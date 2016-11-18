class AddSdkApiVersionToRootFiles < ActiveRecord::Migration
  def change
    add_column :root_files, :sdk_api_version, :integer, null: false, default: 20
  end
end
