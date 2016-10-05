class Student::AppointmentsController < ApplicationController

  def index
    @appointments = current_student.appointments.where(state: params[:state]).includes(:teacher)
  end

  def new
    # TODO return error notification when teacher not existing
    @teacher = Teacher.find(params[:teacher_id])

    @grouped_time_slots = @teacher.recent_availabilities
      .map(&:time_slots).flatten.group_by do |ts|
        ts.strftime("%m-%d")
      end
    @appointments = @teacher.recent_appointments
  end

  def create
    # TODO return error notification when failed to create
    @start = DateTime.parse(params[:start])
    current_student.appointments.create(
      teacher: Teacher.find(params[:teacher_id]),
      scheduled_start: @start,
      creator: current_student
    )
  end

  def update
    # TODO return error notification when appointment not existing or updating failed
    # TODO release the time slot once it's canceled or completed
    @appointment = current_student.appointments.find(params[:id])
    @appointment.cancel
  end
end