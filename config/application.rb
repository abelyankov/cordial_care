require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PboClient
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    ActiveSupport::JSON::Encoding.time_precision = 0
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    #
    # config.api_only = true
    # config.client_id = "cGJvLWNsaWVudC1hcHA="
    # config.client_secret = "aW9z"
    # config.webpush = YAML.load_file("#{Rails.root.to_s}/config/webpush.yml")[Rails.env]

    config.autoload_paths += %W(#{Rails.root}/config/routes)
    config.autoload_paths += %W(#{config.root}/app/classes)
    config.autoload_paths += [config.root.join('app')]
    config.active_job.queue_adapter = :delayed_job

    config.filter_parameters << :password

  end
end

