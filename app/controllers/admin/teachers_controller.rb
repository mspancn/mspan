class Admin::TeachersController < AdminController
  # TODO: audit teachers
  # TODO: audit students
  # TODO: audit appointments
  # TODO: move library assets to vendors
  # TODO: teacher updates
  # TODO: sign up email for teachers
  # TODO: sign up email for students
  # TODO: memcached
  # TODO: cancancan for admin
  # TODO: teacher active
  # TODO: cancancan for teacher
  # TODO: cancancan for student
  # TODO: accessible https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models
  # TODO: student note
  # TODO: teacher note
  # TODO: change old hash style to the new one

  def index
    if request.xhr?
      render json: { data: Teacher.select("id, first_name, last_name, email") }
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
      params.require(:teacher).permit(:time_zone, :phone, :major, :degree, :rate, :balance, :speech_video)
    end
end