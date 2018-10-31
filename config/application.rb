require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module VideoManager
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
