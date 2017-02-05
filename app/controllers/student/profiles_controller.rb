class Student::ProfilesController < StudentController

  def edit
    @profile = current_student
  end

  def update
    @profile = current_student
    if @profile.update(profile_params)
      flash[:notice] = '个人信息更新成功'
      redirect_to edit_student_profile_path
    else
      flash[:error] = "个人信息更新失败"
      render 'edit'
    end
  end

  private

    def profile_params
      params.require(:student).permit(
        :full_name, :age_range, :time_zone, :preferred_teacher_type,
        :avatar, :wechat, :preferred_teacher_gender, purposes: []
      )
    end
end
