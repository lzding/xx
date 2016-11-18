class ChangeCheckDateToUtcDate < ActiveRecord::Migration
  def change
    rename_column :phones, :check_date, :utc_date
    change_column :phones, :utc_date, :integer
  end
end
