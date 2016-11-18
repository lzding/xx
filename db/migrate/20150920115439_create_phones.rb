class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :vendor
      t.string :product_model
      t.string :linux_version
      t.string :build_date

      t.timestamps null: false
    end
  end
end
