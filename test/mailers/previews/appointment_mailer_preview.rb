# Preview all emails at http://localhost:3000/rails/mailers/appointment_mailer
class AppointmentMailerPreview < ActionMailer::Preview

  def new_appointment_email
    AppointmentMailer.new_appointment_email(Appointment.first)
  end

  def student_cancel_appointment_email
    AppointmentMailer.student_cancel_appointment_email(Appointment.first)
  end

  def teacher_cancel_appointment_email
    AppointmentMailer.teacher_cancel_appointment_email(Appointment.first)
  end
end
