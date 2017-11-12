class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @registration = current_user.registrations.create(registration_params.merge(event_id: params[:event_id]))
    @registration.set_total_price
    redirect_to @registration.event, notice: "Thank you for registration!"
  end

  private

  def registration_params
    params.require(:registration).permit(:status, :price, :guests_count, :event_id)
  end
end
