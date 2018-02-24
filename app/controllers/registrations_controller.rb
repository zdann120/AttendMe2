class RegistrationsController < ApplicationController
  before_action :set_event

  def index
    @registrations = @event.registrations
  end

  def create
    @registration = @event.registrations.new(
      registration_params.merge!(user_id: current_user.id)
    )
    if @registration.save
      redirect_to @event, notice: 'Registration successful. Please print your ticket.'
      RegistrationMailer.new_registration(@registration.id).deliver_now
    else
      render 'events/show'
    end
  end

  def ticket
    @registration = Registration.find(params[:id])
    @event = @registration.event.decorate
  end

  def approve
    @registration = Registration.find params[:id]
    if @registration.approve!
      redirect_to event_registrations_path(@event), notice: 'Registration approved!'
    else
      redirect_to event_registrations_path(@event), alert: 'Registration NOT approved.'
    end
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :email)
  end

  def set_event
    @event = Event.find params[:event_id]
  end
end
