class Student::AppointmentsController < ApplicationController

  def index
    @appointments = current_student.appointments.where(state: params[:state]).includes(:teacher)
  end

  def new
    # TODO return error notification when teacher not existing
    @teacher = Teacher.find(params[:teacher_id])
    time_slots = @teacher.availabilities_between(Time.now, 7.days.from_now.midnight)
      .map(&:time_slots).flatten

    @grouped_time_slots = time_slots.group_by do |ts|
      ts.strftime("%m-%d")
    end

    @appointments = @teacher.appointments_between(Time.now, 7.days.from_now.midnight)
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
    @appointment = current_student.appointments.find(params[:id])
    @appointment.update_attributes!(state: params[:state])
  end
end