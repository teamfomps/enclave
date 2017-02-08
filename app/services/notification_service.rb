class NotificationService
  def self.notify(member, message)
    Rails.logger.info 'Sending a Notification'
    if member.confirmed_at? && member.receives_email_notifications?
      NotificationMailer.private_message(member, message).deliver
    end

    if member.mobile_number && member.receives_sms_notifications?
      SMSService.send_sms(member.mobile_number, 'You just received a private message on Forum 2.0.')
    end
  end

  def self.process_private_message_notifications(message)
    message.recipients.each do |r|
      next if r.id == message.sender_id # Don't notfify the sender
      self.notify(r, message)
    end
  end
end
