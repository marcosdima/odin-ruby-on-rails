class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  before_action :set_attendance, only: %i[ destroy ]

  def create
    current_user.attendances.create(
      attended_event_id: params[:event_id]
    )

    redirect_to Event.find(params[:event_id])
  end

  def destroy
    @attendance.destroy if @attendance
    redirect_to event_path(@attendance.attended_event_id)
  end

  private
    def attendance_params
      params.expect(attendance: [ :attended_event_id ])
    end

    def set_attendance
      @attendance = Attendance.find(params[:id])
    end
end
