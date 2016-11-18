class AddStatusToCustom < ActiveRecord::Migration
  def change
    add_column :customs, :status, :boolean, null: false, default: false
    add_index  :customs, :status
  end
end
