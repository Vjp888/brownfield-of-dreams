# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@austrailium.pan'
  layout 'mailer'
end
