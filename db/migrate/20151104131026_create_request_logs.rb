class CreateRequestLogs < ActiveRecord::Migration
  def change
    create_table :request_logs do |t|
      t.integer :custom_id
      t.datetime :run_time
      t.string :android_id

      t.timestamps null: false
    end
  end
end
