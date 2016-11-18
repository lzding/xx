class AddCategoryToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :category, :integer
    add_index :phones, :category
  end
end
