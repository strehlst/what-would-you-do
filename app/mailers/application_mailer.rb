# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM'] || 'from@example.com',
          reply_to: ENV['MAILER_REPLY_TO'] || 'from@example.com'
  layout 'mailer'
end
