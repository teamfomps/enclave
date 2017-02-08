class SMSService
  def self.send_sms(recipient_number, body)
    # Convert number to E.164 format
    parsed_number = Phoner::Phone.parse(recipient_number)

    client = Twilio::REST::Client.new
    client.messages.create(
      from: ENV['TWILIO_FROM_NUMBER'],
      to: parsed_number.format(:default),
      body: "The Enclave: " + body
    )
  end
end
