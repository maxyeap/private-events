class EventAttendancesController < ApplicationController
  def new
    @event_attendance = EventAttendance.new
  end

  def create
    @event_attendance = EventAttendance.new(event_attendance_params)
    if @event_attendance.save
      redirect_to controller: 'events', action: 'show', id: @event_attendance.attended_event_id
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event_attendance = EventAttendance.find_by(attendee_id: current_user.id, attended_event_id: params[:id])
    @event_attendance.destroy

    redirect_to controller: 'events', action: 'show', id: params[:id]
  end

  def event_attendance_params
    params.require(:event_attendance).permit(:attendee_id, :attended_event_id)
  end
end
