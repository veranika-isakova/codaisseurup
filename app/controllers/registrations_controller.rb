class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_room
  def create
    @registration = current_user.registrations.new(registration_params.merge(event_id: params[:event_id]))
    @registration.set_total_price
    @registration.save
    redirect_to @registration.event, notice: "Thank you for registration!"
  end

  private

  def registration_params
    params.require(:registration).permit(:guests_count)
  end
end
