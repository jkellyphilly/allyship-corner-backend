class AddAttendeeIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :attendee_id, :integer
  end
end
