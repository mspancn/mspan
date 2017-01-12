class Admin::StudentsController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data: Student.select("id, full_name, email, notes") }
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    # TODO: handle error
    @student = Student.find(params[:id])
    @student.update!(student_params)
    flash[:notice] = "Updated successfully"
    redirect_to edit_admin_student_path(@student)
  end

  private

    def student_params
      params.require(:student).permit(:notes)
    end
end
