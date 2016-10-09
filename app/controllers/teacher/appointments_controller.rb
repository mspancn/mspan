class Teacher::AppointmentsController < TeacherController

  def index
    @appointments = current_teacher.appointments.where(state: params[:state]).includes(:student)
  end

  def update
    appointment = current_teacher.appointments.find(params[:id])

    if params[:state] == "canceled"
      @appointment = AppointmentService.new(appointment).cancel(current_teacher)
      AppointmentMailer.teacher_cancel_appointment_email(@appointment).deliver_later unless @appointment[:error]
    end

    if @appointment[:error]
      render 'shared/error', locals: { error: @appointment[:error] }
    end
  end
end