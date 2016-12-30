class SystemMailer < ApplicationMailer
  default to: "rbaggio018@gmail.com"

  def student_joined_email(student)
    @student = student
    mail(subject: 'Student Joined')
  end

  def teacher_applied_email(teacher)
    @teacher = teacher
    mail(subject: 'Teacher Applied')
  end
end
