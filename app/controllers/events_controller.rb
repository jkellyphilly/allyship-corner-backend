class EventsController < ApplicationController

  def index
    events = Event.all
    render json: EventSerializer.new(events)
  end

  # If the new event is not valid, send the first error message
  # back in the response with a key of :message
  def create
    new_event = Event.create(event_params)
    if new_event.valid?
      render json: EventSerializer.new(new_event), status: :created
    else
      render json: { message: new_event.errors.full_messages[0] }, status: :not_acceptable
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
  end

  def destroy
    event = Event.find(params[:id])

    # Before destroying this event's record, also
    # destroy all of the comments associated with it
    event.comments.each {|c| c.destroy}

    event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :attendees, :image_url, :user_id, :comments)
  end
end
