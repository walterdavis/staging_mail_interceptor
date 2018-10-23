require 'rails'

# Public: Basic configuration for a Rails application using StagingMailInterceptor
module StagingMailInterceptor
  class Engine < Rails::Engine
    config.staging_mail_interceptor = ActiveSupport::OrderedOptions.new
    config.staging_mail_interceptor.errors_from_address = 'somprog@mail.med.upenn.edu'
    config.staging_mail_interceptor.errors_to_address = 'somprog@mail.med.upenn.edu'

    config.generators do |g|
      g.test_framework 'rspec', fixture: false, view_specs: false
      g.assets false
      g.helper false
      g.javascripts false
      g.stylesheets false
    end
  end
end
