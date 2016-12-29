class Admin::TeachersController < AdminController
  # TODO: audit teachers
  # TODO: audit students
  # TODO: audit appointments
  # TODO: sign up email for teachers
  # TODO: sign up email for students
  # TODO: activated email for teachers
  # TODO: cancancan for admin
  # TODO: cancancan for teacher
  # TODO: cancancan for student
  # TODO: accessible https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models
  # TODO: student notes
  # TODO: style sign up/sign in forms

  def index
    if request.xhr?
      render json: { data: Teacher.select("id, first_name, last_name, email, notes, active") }
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    @teacher.update!(teacher_params)
    flash[:notice] = "Updated successfully"
    redirect_to edit_admin_teacher_path(@teacher)
  end

  private

    def teacher_params
      params.require(:teacher).permit(
        :time_zone, :phone, :major, :degree, :rate,
        :speech_video, :intro, :notes, :active
      )
    end
end
