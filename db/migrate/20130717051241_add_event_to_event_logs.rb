class AddEventToEventLogs < ActiveRecord::Migration
  def change
    add_column :event_logs, :event, :string
  end
end
