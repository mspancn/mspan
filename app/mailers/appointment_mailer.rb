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

  def teacher_appointment_reminder_email(appointment)
    @appointment = appointment
    @teacher = @appointment.teacher
    @student = @appointment.student
    mail(to: @teacher.email, subject: 'MsPan Lesson In 12 Hours')
  end

  def student_appointment_reminder_email(appointment)
    @appointment = appointment
    @student = @appointment.student
    @teacher = @appointment.teacher
    mail(to: @student.email, subject: 'MsPan课程提醒')
  end
end
