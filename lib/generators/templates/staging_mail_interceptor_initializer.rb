if ['development','staging'].include? Rails.env.to_s
  Rails.application.config.staging_mail_interceptor.override_from_address = "change-me@example.com"
  Rails.application.config.staging_mail_interceptor.override_to_address = "change-me@example.com"

  Rails.application.config.action_mailer.perform_deliveries = true
  Rails.application.config.action_mailer.raise_delivery_errors = true
  Rails.application.config.action_mailer.delivery_method = :sendmail
  ActionMailer::Base.register_interceptor(StagingMailInterceptor::MailInterceptor)
end

if ['test'].include? Rails.env.to_s
  Rails.application.config.action_mailer.delivery_method = :test
end
