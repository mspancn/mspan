class Student::HomeController < ApplicationController
  before_action :authenticate_student!

  def dashboard
    @teachers = current_student.teachers
  end
end
