require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Reservester
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.action_mailer.delivery_method = :smtp
    # SMTP settings for gmail
    config.action_mailer.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      #the Rails.application.secrets.gmail_username to set the secret's file instead of ENV[gmail_user]
      :user_name            => Rails.application.secrets.gmail_username,
      :password             => Rails.application.secrets.gmail_password,
      :authentication       => "plain",
      :enable_starttls_auto => true
    }
    config.assets.initialize_on_precompile = false
  end
end
