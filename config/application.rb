require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Georgia
  class Application < Rails::Application
    config.web_console.whitelisted_ips = '86.181.171.120'
    config.active_record.raise_in_transactional_callbacks = true
  end
end
