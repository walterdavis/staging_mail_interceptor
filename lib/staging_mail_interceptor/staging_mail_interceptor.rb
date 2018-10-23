# frozen_string_literal: true
require 'nokogiri'

module StagingMailInterceptor
  class MailInterceptor
    def self.delivering_email(message)
      append_intended_addresses_to_text_part(message)
      append_intended_addresses_to_html_part(message)
      override_recipients(message)
    end

    def self.append_intended_addresses_to_html_part(message)
      html_part = message.html_part || message
      return unless html_part.content_type =~ %r{text/html}
      doc = Nokogiri::HTML html_part.body.to_s
      paragraph = Nokogiri::XML::Node.new('p', doc)
      paragraph.inner_html = '<pre>' + intended_addresses(message) + '</pre>'
      doc.at_css('body').add_child paragraph
      html_part.body = doc.to_html
    end

    def self.append_intended_addresses_to_text_part(message)
      text_part = message.text_part || message
      return unless text_part.content_type =~ %r{text/plain}
      text_part.body = text_part.body.to_s + intended_addresses(message) if text_part.present?
    end

    def self.intended_addresses(message)
      <<-eof
        ----------------
        Intended sender: #{message.from}
        Intended recipient(s): #{message.to}
        Intended cc(s): #{message.cc}
        Intended bcc(s): #{message.bcc}
      eof
    end

    def self.override_recipients(message)
      message.from = Rails.configuration.staging_mail_interceptor.override_from_address
      message.to = Rails.configuration.staging_mail_interceptor.override_to_address
      message.cc = nil
      message.bcc = nil
    end
  end
end
