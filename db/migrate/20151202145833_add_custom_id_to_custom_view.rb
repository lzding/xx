class AddCustomIdToCustomView < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE OR REPLACE VIEW custom_reports AS SELECT
       c.id as id,
       c.name AS name,
       rl.status AS status,count(rl.id) AS count,date_format(rl.created_at,'%Y-%m-%d') AS day
    FROM (customs c left join root_logs rl on((c.id = rl.custom_id))) group by day,rl.status,c.id order by day desc,c.id;
    SQL
  end

  def down
    execute <<-SQL
      drop view custom_reports
    SQL
  end
end
