class AppointmentMailer < ApplicationMailer

  def new_appointment_email(appointment)
    @appointment = appointment
    @teacher = @appointment.teacher
    mail(to: @teacher.email, subject: 'New Lesson Scheduled')
  end

  def student_cancel_appointment_email(appointment)
    @appointment = appointment
    @teacher = @appointment.teacher
    mail(to: @teacher.email, subject: 'Lesson Canceled')
  end

  def teacher_cancel_appointment_email(appointment)
    @appointment = appointment
    @student = @appointment.student
    mail(to: @student.email, subject: 'MsPan课程被取消')
  end
end
