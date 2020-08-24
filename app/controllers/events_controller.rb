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
      # Find the Attendee instance that belongs to the user who created
      # the event and add that Attendee to the event's attendees
      current_attendee = Attendee.find_by(user_id: params[:event][:user_id])
      new_event.attendees << current_attendee
      new_event.save

      render json: EventSerializer.new(new_event), status: :created
    else
      render json: { message: new_event.errors.full_messages[0] }, status: :not_acceptable
    end
  end

  def update
    event = Event.find(params[:id])
    attendee = Attendee.find_by(user_id: params[:attendee_id])

    # Either add the attendee to the event's attendees
    # or remove this attendee, determined by :is_adding param
    if params[:is_adding]
      event.attendees << attendee
    else
      event.attendees.delete(attendee)
    end
    event.save

    render json: EventSerializer.new(event)
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
    params.require(:event).permit(:name, :location, :image_url, :user_id, :comments)
  end
end
