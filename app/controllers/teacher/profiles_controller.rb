class Teacher::ProfilesController < TeacherController

  def show
    @profile = current_teacher
  end
end
