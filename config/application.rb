require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BaseDemo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'
    config.i18n.default_locale = :zh
    config.autoload_paths += Dir["#{config.root}/lib"]
    config.action_controller.forgery_protection_origin_check = false

    config.eager_load_paths += %W(
      #{Rails.root}/lib
      #{Rails.root}/app/services
    )

    # redis
    config.cache_store = :redis_store, {
      host: Rails.application.secrets.redis_host,
      port: Rails.application.secrets.redis_port,
      db: Rails.application.secrets.redis_db,
      password: Rails.application.secrets.redis_pwd,
      namespace: Rails.application.secrets.redis_namespace
    }

  end
end


# config
CONFIG = Rails.application.secrets
