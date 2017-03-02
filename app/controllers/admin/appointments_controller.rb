class Admin::AppointmentsController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data:
        Appointment.joins(:teacher).joins(:student)
          .select("
            appointments.id,
            students.full_name AS student_name,
            students.email AS student_email,
            concat(teachers.first_name, ' ', teachers.last_name) AS teacher_name,
            teachers.email AS teacher_email,
            scheduled_start,
            state
          ")
      }
    end
  end
end
