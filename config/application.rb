require_relative 'boot'

require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
require 'action_cable'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Teamvoy
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.languages_json_data_url = 'https://gist.githubusercontent.com/g3d/8f524cb3252d9e026d3f33196c1b51dd/raw/a04bb2d48f8545554f4742927aad6f55ab1e49e7/data.json'
    config.cells.with_assets = ['language/cell/search']
    config.autoload_paths += %W(#{config.root}/lib)
  end
end
