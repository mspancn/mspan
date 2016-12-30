class Student::AppointmentsController < StudentController
  load_and_authorize_resource

  def index
    @appointments = current_student.appointments.where(state: params[:state]).includes(:teacher)
  end

  def new
    raise CanCan::AccessDenied if !Teacher.find(params[:teacher_id]).active?

    # TODO return error notification when teacher not existing
    @teacher = Teacher.find(params[:teacher_id])

    @grouped_time_slots = @teacher.schedulable_time_slots.group_by do |time_slot|
        time_slot.strftime("%m-%d")
      end
    @appointments = @teacher.recent_appointments
  end

  def create
    raise CanCan::AccessDenied if !Teacher.find(params[:teacher_id]).active?

    @appointment = AppointmentService.new(
      Appointment.new(
        teacher: Teacher.find(params[:teacher_id]),
        student: current_student,
        scheduled_start: DateTime.parse(params[:start]),
        creator: current_student
      )
    ).create

    if @appointment[:error]
      render 'shared/error', locals: { error: @appointment[:error] }
      return
    end

    AppointmentMailer.new_appointment_email(@appointment).deliver_later
  end

  def update
    appointment = current_student.appointments.find(params[:id])

    if params[:state] == "canceled"
      @appointment = AppointmentService.new(appointment).cancel(current_student)
      AppointmentMailer.student_cancel_appointment_email(@appointment).deliver_later unless @appointment[:error]
    end

    if params[:state] == "completed"
      @appointment = AppointmentService.new(appointment).complete
    end

    if @appointment[:error]
      render 'shared/error', locals: { error: @appointment[:error] }
    end
  end
end