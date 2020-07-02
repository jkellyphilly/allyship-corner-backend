class EventsController < ApplicationController

  def index
    events = Event.all
    render json: EventSerializer.new(events)
  end

  def create
    new_event = Event.create(event_params)
    render json: EventSerializer.new(new_event)
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :attendees, :image_url, :comments)
  end
end
