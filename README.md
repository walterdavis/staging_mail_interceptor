# Staging Mail Interceptor

Configure an address or group of addresses to receive all e-mails generated in a staging or dev environment.

## Install

* Add to your Gemfile: `gem 'staging_mail_interceptor', github: 'walterdavis/staging_mail_interceptor'`
* Run the generator: `rails g staging_mail_interceptor:install`
* Update the initializer to user your preferred delivery address for mail.

## Use

* Run your application in staging or development
* Send mail from your application
* All messages are redirected to the user(s) you designate, with a footer describing the intended recipients.
