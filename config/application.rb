require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Enclave
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'
    
    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.view_specs false
      g.helper_specs false
      g.stylesheets = false
      g.javascripts = false
      g.helper = false
    end

    config.action_mailer.smtp_settings = {
      address:              ENV['SMTP_SERVER_HOSTNAME'],
      port:                 ENV['SMTP_SERVER_PORT'],
      user_name:            ENV['SMTP_USERNAME'],
      password:             ENV['SMTP_PASSWORD'],
      authentication:       :login,
      enable_starttls_auto: true
    }

    config.action_mailer.default_url_options = {
      host: ENV['HOSTNAME']
    }
  end
end
