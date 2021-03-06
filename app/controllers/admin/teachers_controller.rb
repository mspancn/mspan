class Admin::TeachersController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data: Teacher.select("id, first_name, last_name, email, notes, active") }
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
    @earliest_hour, @latest_hour, @availabilities_datetime =
      AvailabilityService.new(@teacher).calendar_info
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      flash[:notice] = "Updated successfully"
      redirect_to edit_admin_teacher_path(@teacher)
    else
      flash[:error] = "Failed to update"
      @earliest_hour, @latest_hour, @availabilities_datetime =
        AvailabilityService.new(@teacher).calendar_info
      render 'edit'
    end
  end

  private

    def teacher_params
      params.require(:teacher).permit(
        :time_zone, :phone, :major, :degree, :rate, :first_name, :last_name, :mandarin,
        :teaching_experience, :certificate, :speech_video, :intro, :notes, :active,
        :zoom, :wechat, :paypal, :avatar
      )
    end
end
