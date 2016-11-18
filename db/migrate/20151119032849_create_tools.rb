class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :file_name, null: false
      t.boolean :enabled, null: false, default: true

      t.timestamps null: false
    end
    add_index :tools, :enabled
    add_index :tools, :file_name
  end
end
