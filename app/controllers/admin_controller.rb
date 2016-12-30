class AdminController < ApplicationController
  before_action :authenticate_admin!
  alias_method :current_user, :current_admin

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.js   { head :forbidden }
      format.html { redirect_to admin_root_path, alert: exception.message }
    end
  end

  around_action :set_time_zone

  def audited_user
    current_admin
  end

  private

    def set_time_zone
      Time.use_zone(current_admin.time_zone) { yield }
    end
end
