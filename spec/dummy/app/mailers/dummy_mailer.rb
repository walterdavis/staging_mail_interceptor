class DummyMailer < ActionMailer::Base
  default from: 'test_default_from@bogus.upenn.edu'

  def some_dumb_email
    mail(to: 'test_to@bogus.upenn.edu', cc: 'test_cc@bogus.upenn.edu', bcc: 'test_bcc@bogus.upenn.edu', subject: 'Test') do |format|
      format.text { 'Test, please ignore' }
      format.html { 'Test, please ignore' }
    end
  end

  def some_dumb_text_only_email
    mail(to: 'test_to@bogus.upenn.edu', cc: 'test_cc@bogus.upenn.edu', bcc: 'test_bcc@bogus.upenn.edu', subject: 'Test') do |format|
      format.text { 'Test, please ignore' }
    end
  end

  def some_dumb_html_only_email
    mail(to: 'test_to@bogus.upenn.edu', cc: 'test_cc@bogus.upenn.edu', bcc: 'test_bcc@bogus.upenn.edu', subject: 'Test') do |format|
      format.html { 'Test, please ignore' }
    end
  end

end
