class AddCmdToCustom < ActiveRecord::Migration
  def change
    add_column :customs, :cmd, :string
  end
end
