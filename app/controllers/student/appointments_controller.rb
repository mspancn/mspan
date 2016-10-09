class Student::AppointmentsController < StudentController

  def index
    @appointments = current_student.appointments.where(state: params[:state]).includes(:teacher)
  end

  def new
    # TODO return error notification when teacher not existing
    @teacher = Teacher.find(params[:teacher_id])

    @grouped_time_slots = @teacher.schedulable_time_slots.group_by do |time_slot|
        time_slot.strftime("%m-%d")
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
      return
    end

    # TODO: might want to use DelayedJob for this later
    AppointmentMailer.new_appointment_email(@appointment).deliver_later
  end

  def update
    @appointment = current_student.appointments.find(params[:id])

    if params[:state] == "canceled"
      if !@appointment.cancel
        render 'shared/error', locals: { error: "Error." }
        return
      end
      AppointmentMailer.student_cancel_appointment_email(@appointment).deliver_later
    end

    if params[:state] == "completed" and !@appointment.complete
      render 'shared/error', locals: { error: "Error." }
    end
  end
end