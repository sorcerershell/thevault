class CreateEventLogs < ActiveRecord::Migration
  def change
    create_table :event_logs do |t|
      t.integer :event_source_id
      t.string :event_source_type
      t.integer :user_id
      t.integer :version_id

      t.timestamps
    end

    add_index :event_logs, [:event_source_id, :event_source_type]
    add_index :event_logs, :user_id
    add_index :event_logs, :version_id
  end
end
