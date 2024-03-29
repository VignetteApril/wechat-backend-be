require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shike
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.autoload_paths << "#{Rails.root}/lib"
    config.i18n.available_locales = ['en', 'zh-CN']
    config.i18n.default_locale = 'zh-CN'.to_sym
    config.i18n.fallbacks = true
    config.active_job.queue_adapter = :sidekiq
    # specific slim as dafault template engine for generator
    config.generators do |g|
      g.template_engine = :slim
    end
  end
end
