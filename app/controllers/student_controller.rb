class StudentController < ApplicationController
  before_action :authenticate_student!
  alias_method :current_user, :current_student

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.js   { head :forbidden }
      format.html { redirect_to student_root_path, alert: exception.message }
    end
  end

  around_action :set_time_zone

  private

    def set_time_zone
      Time.use_zone(current_student.time_zone) { yield }
    end
end
