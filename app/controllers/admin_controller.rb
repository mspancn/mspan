class AdminController < ApplicationController
  before_action :authenticate_admin!

  around_action :set_time_zone

  def audited_user
    current_admin
  end

  private

    def set_time_zone
      Time.use_zone(current_admin.time_zone) { yield }
    end
end
