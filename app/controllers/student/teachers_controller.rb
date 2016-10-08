class Student::TeachersController < StudentController

  def index
    @teachers = Teacher.all
  end

  def create
    @teacher = Teacher.find_by_id(params[:teacher_id])

    if !@teacher or !current_student.add_teacher(@teacher)
      render "add_teacher_error"
    end
  end

  def destroy
    @teacher = Teacher.find_by_id(params[:id])

    if !@teacher or !current_student.remove_teacher(@teacher)
      render "remove_teacher_error"
    end
  end
end
