# frozen_string_literal: true
require 'rails_helper'
include EmailSpec::Helpers
include EmailSpec::Matchers

RSpec.shared_examples 'an intercepted email' do
  let(:redirected_from) { 'a@a.com' }
  let(:redirected_to) { 'b@b.com' }

  let!(:email_parts) do
    email.multipart? ? email.parts : [email]
  end

  let!(:intended_from) { email.from }
  let!(:intended_to) { email.to }
  let!(:intended_cc) { email.cc }
  let!(:intended_bcc) { email.bcc }

  let(:intended_sender_footer) { "Intended sender: #{intended_from}" }
  let(:intended_recipient_footer) { "Intended recipient(s): #{intended_to}" }
  let(:intended_cc_footer) { "Intended cc(s): #{intended_cc}" }
  let(:intended_bcc_footer) { "Intended bcc(s): #{intended_bcc}" }

  before(:each) do
    Rails.configuration.x.staging_mail_interceptor.override_from_address = redirected_from
    Rails.configuration.x.staging_mail_interceptor.override_to_address = redirected_to

    StagingMailInterceptor::MailInterceptor.delivering_email(email)
  end

  it 'should change recipients appropriately when interceptor is run' do
    expect(email).not_to deliver_from(intended_from)
    expect(email).not_to deliver_to(intended_to)
    expect(email).not_to cc_to(intended_cc)
    expect(email).not_to bcc_to(intended_bcc)

    expect(email).to deliver_from(redirected_from)
    expect(email).to deliver_to(redirected_to)
  end

  it 'includes the intended sender' do
    email_parts.each do |email_part|
      expect(email_part.body.include?(intended_sender_footer)).to be true
    end
  end

  it 'includes the intended recipient' do
    email_parts.each do |email_part|
      expect(email_part.body.include?(intended_recipient_footer)).to be true
    end
  end

  it 'includes the intended cc' do
    email_parts.each do |email_part|
      expect(email_part.body.include?(intended_cc_footer)).to be true
    end
  end

  it 'includes the intended bcc' do
    email_parts.each do |email_part|
      expect(email_part.body.include?(intended_bcc_footer)).to be true
    end
  end
end

describe 'StagingMailInterceptor::MailInterceptor' do
  context 'a multipart email' do
    let(:email) { DummyMailer.some_dumb_email }
    it_behaves_like 'an intercepted email'
  end

  context 'when an email only has a text part' do
    let(:email) { DummyMailer.some_dumb_text_only_email }
    it_behaves_like 'an intercepted email'
  end

  context 'when an email only has an html part' do
    let(:email) { DummyMailer.some_dumb_html_only_email }
    it_behaves_like 'an intercepted email'
  end
end
