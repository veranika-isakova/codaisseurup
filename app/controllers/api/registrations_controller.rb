class Api::RegistrationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_event
  def create
    registration = @event.registrations.new(registration_params.merge(event_id: params[:event_id]))
    registration.set_total_price

    if registration.save
      render status: 200, json: {
        message: "Registration successfully created",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be created",
        errors: registration.errors
      }.to_json
    end
  end

  def update
    total_price = params[:guests_count].to_i * @event.price
    registration = @event.registrations.find(params[:id])

    if registration.update(registration_params.merge(price: total_price))
      render status: 200, json: {
        message: "Registration successfully updated",
        event: @event,
        registration: registration
      }.to_json
    else
      render status: 422, json: {
        message: "Registration could not be updated",
        errors: registration.errors
      }.to_json
    end
  end

  def destroy
    registration = @event.registrations.find(params[:id])
    registration.destroy

    render status: 200, json: {
      message: "Registration successfully deleted",
      event: @event,
      registration: registration
    }.to_json
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end


  def registration_params
    params.require(:registration).permit(:guests_count)
  end
end
