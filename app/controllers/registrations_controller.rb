class RegistrationsController < ApplicationController
  def create
    @event = Event.find params[:event_id]
    @registration = Registration.new(
      registration_params.merge!(user_id: current_user.id, event_id: @event.id)
    )
    if @registration.save
      redirect_to @event, notice: 'Registration successful.'
    else
      render 'events/show'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :email)
  end
end
