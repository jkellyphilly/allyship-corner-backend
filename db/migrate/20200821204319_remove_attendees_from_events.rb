class RemoveAttendeesFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :attendees
  end
end
