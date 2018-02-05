class TwilioController < ApplicationController
  skip_before_action :verify_authenticity_token

  def receive
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
    message_body = params["Body"]
    from_number = params["From"]
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "Great. Rachel will be in touch! 😄"
    )
  end
end
