class Student::HomeController < StudentController

  def dashboard
    @teachers = current_student.teachers
    @next_scheduled_appointment = current_student.next_scheduled_appointment
    @uncompleted_appointments = current_student.uncompleted_appointments
  end

  def contact

  end
end
