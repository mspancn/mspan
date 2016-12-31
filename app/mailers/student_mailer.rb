class StudentMailer < ApplicationMailer

  def welcome_email(student)
    @student = student
    mail(to: @student.email, subject: 'Welcome to MsPan')
  end
end
