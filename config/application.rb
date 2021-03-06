require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SimplebbsApp
  class Application < Rails::Application
    # set default_locale to :ja
    I18n.config.available_locales = :ja
    I18n.default_locale = :ja
    config.i18n.default_locale = :ja
    
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |generators_config|
      generators_config.assets false
      generators_config.helper false
      generators_config.skip_routes true
      generators_config.test_framework :rspec, {
        view_specs: false,
      }
    end

  end
end
