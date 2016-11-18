class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.string :name
      t.datetime :expire_date
      t.string :token

      t.timestamps null: false
    end
  end
end
