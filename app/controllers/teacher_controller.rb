class TeacherController < ApplicationController
  before_action :authenticate_teacher!
  alias_method :current_user, :current_teacher

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.js   { head :forbidden }
      format.html { redirect_to teacher_root_path, alert: exception.message }
    end
  end

  around_action :set_time_zone

  private

    def set_time_zone
      Time.use_zone(current_teacher.time_zone) { yield }
    end
end
