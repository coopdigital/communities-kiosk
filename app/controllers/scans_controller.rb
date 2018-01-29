require 'securerandom'

class ScansController < ApplicationController
  def create
    scan = Scan.create!(
      uuid: SecureRandom.hex(3),
      card_number: params[:card_number],
      screen_id: params[:screen_id]
    )
    render json: scan
  end
end
