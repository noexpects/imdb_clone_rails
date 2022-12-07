# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.dig(:mailer, :from_email)
  layout 'mailer'
end
