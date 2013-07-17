class VersionObserver < ActiveRecord::Observer
  observe :document

  def after_create(record)
    create_event_log(record, PaperTrail.whodunnit, 'create')
  end

  # no metaprogramming here, just copy'n'paste, so code readability kept safe
  def after_update(record)
    create_event_log(record, PaperTrail.whodunnit, 'update')
  end

  # copy'n'paste again
  def after_destroy(record)
    create_event_log(record, PaperTrail.whodunnit, 'destroy')
  end

  private

  def create_event_log(event_source, user, event)
    # user sometimes can be empty
    # PaperTrail can be disabled in test
    if PaperTrail.enabled? && user
      # most straightforward way, paper_trail implementation-independent
      version = event_source.versions.last
      EventLog.create(user: user, event_source_type: event_source.class.to_s,
        event_source_id: event_source.id, event: event, version_id: version.id)
    end
  end
end
