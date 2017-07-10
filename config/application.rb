require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LifeAppliance
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

   ActionMailer::Base.smtp_settings = {
        :address        => "mail.svenskadomaner.se",
        :port           =>  465,
        :user_name      => "hello@lifeappliance.cc",
        :password       => "Ruby5379902",
        :authentication =>  'login',
        :enable_starttls_auto => true
    }
  end
end
