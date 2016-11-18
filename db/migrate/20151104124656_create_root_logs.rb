class CreateRootLogs < ActiveRecord::Migration
  def change
    create_table :root_logs do |t|
      t.integer :status
      t.string :net_operator
      t.string :android_id
      t.integer :run_time
      t.string :rf_md5
      t.string :msg
      t.string :display_country
      t.string :display_language
      t.string :sim_operator_name
      t.integer :custom_id

      t.timestamps null: false
    end
  end
end
