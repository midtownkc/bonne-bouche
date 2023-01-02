# frozen_string_literal: true

# Main Application Mailer Class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
