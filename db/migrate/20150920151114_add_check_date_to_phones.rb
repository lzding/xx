class AddCheckDateToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :check_date, :DateTime
    add_index :phones, :check_date
    add_index :phones, :linux_version
  end
end
