class CreateRefs < ActiveRecord::Migration
  def change
    create_table :refs do |t|
      t.integer :version
      t.string :channel
      t.string :exec_file

      t.timestamps null: false
    end
  end
end
