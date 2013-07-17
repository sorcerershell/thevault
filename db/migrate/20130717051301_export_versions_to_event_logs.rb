class ExportVersionsToEventLogs < ActiveRecord::Migration
  def up
    execute "INSERT INTO event_logs (version_id, event_source_type, event_source_id,
      user_id, event, created_at, updated_at) SELECT v.id, v.item_type AS event_source_type,
      v.item_id AS event_source_id, cast(v.whodunnit as integer) AS user_id, v.event as event, 
      v.created_at AS created_at, v.created_at AS updated_at FROM versions v WHERE
      v.item_type IN ('Document') AND v.event IN ('create', 'update', 'destroy');"
  end

  def down
  end
end
