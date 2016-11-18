class AddSdkApiVersionToGlobals < ActiveRecord::Migration
  def change
    add_column :globals, :sdk_api_version, :integer, null:false, default:20
  end
end
