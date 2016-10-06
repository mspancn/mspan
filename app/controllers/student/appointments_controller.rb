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
    @appointment = AppointmentService.new(
      Teacher.find(params[:teacher_id]),
      current_student,
      DateTime.parse(params[:start]),
      current_student
    ).create

    if @appointment[:error]
      render 'shared/error', locals: { error: @appointment[:error] }
    end
  end

  def update
    @appointment = current_student.appointments.find(params[:id])

    if params[:state] == "canceled" and !@appointment.cancel
      render 'shared/error', locals: { error: "Error." }
    end

    if params[:state] == "completed" and !@appointment.complete
      render 'shared/error', locals: { error: "Error." }
    end
  end
end