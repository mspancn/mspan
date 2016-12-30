class TeacherMailer < ApplicationMailer

  def welcome_email(teacher)
    @teacher = teacher
    mail(to: @teacher.email, subject: 'Thanks for applying MsPan')
  end
end
