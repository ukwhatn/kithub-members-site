Rails.application.config.session_store :redis_store,
  servers: %w(redis://redis:6379/1/session),
  key: '_kithub_members_site_session'
