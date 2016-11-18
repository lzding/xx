class AddCountToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :count, :integer
  end
end
