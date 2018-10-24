# frozen_string_literal: true
Gem::Specification.new do |s|
  s.name        = 'staging_mail_interceptor'
  s.version     = '0.0.4'
  s.date        = '2018-10-23'
  s.summary     = 'Staging Mail Interceptor'
  s.description = 'Includes a mail interceptor.'
  s.authors     = ['Walter Davis', 'Raj Iyengar']
  s.email       = 'waltd@wdstudio.com'
  s.files       = Dir['{app,lib}/**/*'] + %w(MIT-LICENSE README.md)
  s.homepage    = 'https://github.com/walterdavis/staging_mail_interceptor'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 2.3.0'

  s.add_dependency 'rails'
  s.add_dependency 'nokogiri'
  s.add_dependency 'mail'
  s.add_development_dependency 'email_spec'
  s.add_development_dependency 'rspec-html-matchers'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rails-controller-testing'
end
