class AddIpToRequestLogs < ActiveRecord::Migration
  def change
    add_column :request_logs, :ip, :string
  end
end
