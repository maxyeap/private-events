class AddFkConstraintsToEventAttendanceEventAttendees < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :event_attendances, :events, column: :attended_event_id
  end
end
