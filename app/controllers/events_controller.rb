class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  def index
    @events = Event.all
    authorize @events
    @events = @events.decorate
  end

  def show
    @registration = @event.registrations.new
    @event = @event.decorate
  end

  def new
    @event = current_user.events.new
    authorize @event
  end

  def edit
  end

  def create
    @event = Event.new(event_params.merge!({user_id: current_user.id}))
    authorize @event
    if @event.save!
      redirect_to @event, notice: "Event was successfully created."
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: "Event was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: "Event was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:user_id, :title, :starts_at, :ends_at, :description, :location, :contact_email, :registration_starts_at, :registration_ends_at, :price, :registration_requires_approval)
  end
end
