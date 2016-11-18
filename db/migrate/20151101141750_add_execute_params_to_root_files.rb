class AddExecuteParamsToRootFiles < ActiveRecord::Migration
  def change
    add_column :root_files, :execute_params, :string
  end
end
