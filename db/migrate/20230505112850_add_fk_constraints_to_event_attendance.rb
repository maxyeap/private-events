class AddFkConstraintsToEventAttendance < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :event_attendances, :users, column: :attendee_id
  end
end
