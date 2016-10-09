class Teacher::AppointmentsController < TeacherController

  def index
    @appointments = current_teacher.appointments.where(state: params[:state]).includes(:student)
  end

  def update
    @appointment = current_teacher.appointments.find(params[:id])

    if params[:state] == "canceled"
      if !@appointment.cancel
        render 'shared/error', locals: { error: "Error." }
        return
      end
      AppointmentMailer.teacher_cancel_appointment_email(@appointment).deliver_later
    end
  end
end