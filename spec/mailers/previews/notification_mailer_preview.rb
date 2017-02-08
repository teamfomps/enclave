# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview
  def private_message
    m = Member.first
    msg = m.mailbox.conversations.first.messages.first
    NotificationMailer.private_message(m, msg)
  end
end
