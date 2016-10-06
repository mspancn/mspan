class Student::HomeController < ApplicationController
  before_action :authenticate_student!

  def dashboard
    @teachers = current_student.teachers
    @next_scheduled_appointment = current_student.next_scheduled_appointment
    @uncompleted_appointments = current_student.uncompleted_appointments
  end
end
