module StagingMailInterceptor
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      desc 'Creates initializer with appropriate default configurations for'  +
      'staging_mail_interceptor gem in various environments'

      def copy_initializer
        template 'staging_mail_interceptor_initializer.rb',
                 'config/initializers/staging_mail_interceptor.rb'

        puts 'Copied staging_mail_interceptor initializer into project'
      end
    end
  end
end