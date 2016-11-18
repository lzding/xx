class AddSdkVToRootLogs < ActiveRecord::Migration
  def change
    add_column :root_logs, :sdkV, :string
  end
end
