require File.expand_path('../boot', __FILE__)
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WordSp
  # Application
  class Application < Rails::Application
# mohab
# 3.4.2015
# :fixtures => true specifies to generate a fixture for each model
#  (using a Factory Girl factory, instead of an actual fixture)
# :view_specs => false says to skip generating view specs.
# :helper_specs => false skips generating specs for the helper files Rails
#  generates with each controller.
# As your comfort level with RSpec improves, consider changing this option
# to true and testing these files.
# :routing_specs => false omits a spec file for your config/routes.rb file.
# And finally, g.fixture_replacement :factory_girl tells Rails to generate
#  factories instead of fixtures,
# and to save them in the spec/factories directory.
config.generators do |g|
g.test_framework :rspec,
:fixtures => true,
:view_specs => false,
:helper_specs => false,
:routing_specs => false,
:controller_specs => true,
:request_specs => true
g.fixture_replacement :factory_girl, :dir => "spec/factories"
end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.

    config.active_record.raise_in_transactional_callbacks = true
  end
end
