class StudentController < ApplicationController
  before_action :authenticate_student!

  around_action :set_time_zone

  def audited_user
    current_student
  end

  private

    def set_time_zone
      Time.use_zone(current_student.time_zone) { yield }
    end
end
