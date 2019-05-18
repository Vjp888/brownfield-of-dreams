# frozen_string_literal: true

class UserActivatorMailer < ApplicationMailer
  def activate(user)
    hashids = Hashids.new('saxton hale')
    @id = hashids.encode(user.id)
    mail(to: user.email, subject: 'Activate your Turing Tutorial Account')
  end
end
