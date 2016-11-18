class ChanageMsgTypeToText < ActiveRecord::Migration
  def self.up
    change_column :root_logs, :msg, :text
  end

  def self.down
    change_column :root_logs, :msg, :string
  end
end
