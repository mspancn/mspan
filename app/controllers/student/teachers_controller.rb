class Student::TeachersController < StudentController

  def index
    @teachers = Teacher.all
  end

  def create
    @teacher = Teacher.find_by_id(params[:teacher_id])
    relationship = RelationshipService.new(@teacher, current_student).create

    if relationship[:error]
      render 'shared/error', locals: { error: relationship[:error] }
    end
  end

  def destroy
    @teacher = Teacher.find_by_id(params[:id])
    relationship = RelationshipService.new(@teacher, current_student).destroy

    if relationship[:error]
      render 'shared/error', locals: { error: relationship[:error] }
    end
  end
end
