require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mspan
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Load services
    config.autoload_paths += %W(#{config.root}/app/services)

    # Set queue adapter for Delayed Job
    config.active_job.queue_adapter = :delayed_job

    # For page caching
    config.action_controller.page_cache_directory = "#{Rails.root}/public"
  end
end
