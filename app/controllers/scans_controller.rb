require 'securerandom'

class ScansController < ApplicationController
  def create
    scan = Scan.create!(
      uuid: SecureRandom.hex(3),
      card_number: params[:card_number],
      screen_id: params[:screen_id]
    )

    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: Rails.application.secrets.twilio_demo_user,
      body: "Aanya is looking for people to help her out with a community garden in Morley. Reply with YES and we'll put you in touch."
    )
    render json: scan
  end
end
