class Admin::AppointmentsController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data:
        Appointment.joins(:teacher).joins(:student)
          .select("
            appointments.id,
            students.email AS student_email,
            teachers.email AS teacher_email,
            scheduled_start,
            state
          ")
      }
    end
  end
end
