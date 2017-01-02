class Admin::TeachersController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data: Teacher.select("id, first_name, last_name, email, notes, active") }
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    # TODO: handle error
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