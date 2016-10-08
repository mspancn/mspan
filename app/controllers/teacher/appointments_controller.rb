class Teacher::AppointmentsController < TeacherController

  def index
    @appointments = current_teacher.appointments.where(state: params[:state]).includes(:student)
  end

  def update
    @appointment = current_teacher.appointments.find(params[:id])

    if params[:state] == "canceled" and !@appointment.cancel
      render 'shared/error', locals: { error: "Error." }
    end

    if params[:state] == "completed" and !@appointment.complete
      render 'shared/error', locals: { error: "Error." }
    end
  end
end