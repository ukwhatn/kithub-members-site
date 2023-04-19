require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KithubMembersSite
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # cache store
    config.session_store = :redis_store, {
      servers: [
        {
          host: 'redis',
          port: 6379,
          db: 0,
          namespace: 'session'
        }
      ]
    }

    config.cache_store = :redis_store, {
      servers: [
        {
          host: 'redis',
          port: 6379,
          db: 0,
          namespace: 'session'
        }
      ]
    }
  end
end
