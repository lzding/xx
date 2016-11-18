class CreatePhoneParams < ActiveRecord::Migration
  def change
    create_table :phone_params do |t|
      t.string :name
      t.string :value
      t.references :phone, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
