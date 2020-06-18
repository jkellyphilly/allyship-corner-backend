class EventsController < ApplicationController

  def index
    events = Event.all
    render json: events
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
  end
end
