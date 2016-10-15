class TeacherController < ApplicationController
  before_action :authenticate_teacher!

  around_action :set_time_zone

  def audited_user
    current_teacher
  end

  private

    def set_time_zone
      Time.use_zone(current_teacher.time_zone) { yield }
    end
end
