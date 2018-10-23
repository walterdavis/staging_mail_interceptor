# frozen_string_literal: true
class StagingMailInterceptor::ErrorMailer < ActionMailer::Base
  def for_error(e, options={})
    @error = e

    if Rails.configuration.respond_to?(:use_ceal) && Rails.configuration.use_ceal
      @ceal_id = options[:ceal_id]
      @pennkey = options[:current_user].try(:pennkey) || 'Unable to determine PennKey'
      @person_id = Ceal::Session.get_person_id if Ceal::Session.respond_to?(:get_person_id)
      @original_pennkey = Ceal::Session.get_original_pennkey if Ceal::Session.respond_to?(:get_original_pennkey)
      set_oracle_connection_info_ivars
    end

    @user = options[:current_user]
    @params = options[:request]&.parameters&.except(:password, :password_confirmation) 
    unless @params.blank?
      @params.each do |p|
        p.delete_if { |k, v| ['password', 'password_confirmation'].include? k.to_s }
      end
    end

    errors_to = Rails.configuration.staging_mail_interceptor.errors_to_address
    errors_from = Rails.configuration.staging_mail_interceptor.errors_from_address
    app_name = Rails.application.class.parent_name
    mail(to: errors_to, from: errors_from,
         subject: "#{Rails.env}: #{app_name} error occurred")
  end

  private

  def set_oracle_connection_info_ivars
    @inst_id = Ceal::Session.get_inst_id if Ceal::Session.respond_to?(:get_inst_id)
    @serial_no = Ceal::Session.get_serial_no if Ceal::Session.respond_to?(:get_serial_no)

    @sid = Ceal::Session.get_sid
    @schema = Ceal::Session.get_current_schema
  end
end
