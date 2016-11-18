class AddSourceNameToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :source_name, :string
    add_index :phones, :source_name
  end
end
