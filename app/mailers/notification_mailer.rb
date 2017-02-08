class NotificationMailer < ApplicationMailer
  def private_message(recipient, message)
    @recipient = recipient
    @message = message

    subject = "[Enclave] #{ @message.sender.full_name } sent you a message"
    mail(to: @recipient.email, subject: subject)
  end
end
