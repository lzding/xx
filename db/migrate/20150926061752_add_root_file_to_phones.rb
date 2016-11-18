class AddRootFileToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :root_file_id, :integer
    add_index :phones, :root_file_id
  end
end
