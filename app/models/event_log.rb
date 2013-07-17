class EventLog < ActiveRecord::Base
  attr_accessible :user, :event_source_type, :event_source_id, :event, :version_id
  belongs_to :event_source, polymorphic: true
  belongs_to :user
end
