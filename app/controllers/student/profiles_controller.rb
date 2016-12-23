class Student::ProfilesController < StudentController

  def edit
    @profile = current_student
  end

  def update
    @profile = current_student
    @profile.update!(profile_params)
    flash[:notice] = '个人信息更新成功'
    redirect_to edit_student_profile_path
  end

  private

    def profile_params
      params.require(:student).permit(
        :full_name, :age_range, :time_zone, :preferred_teacher_type,
        :preferred_teacher_gender, :purposes => []
      )
    end
end
