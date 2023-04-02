require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TennisClub
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0



    config.to_prepare do
      Devise::SessionsController.layout "visitor"
      Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "user" : "visitor" }
      Devise::ConfirmationsController.layout "visitor"
      Devise::UnlocksController.layout "visitor"
      Devise::PasswordsController.layout "visitor"
    end

    # Configuration for the application, engines, and railties goes here.
    config.i18n.default_locale = :fr

    
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
