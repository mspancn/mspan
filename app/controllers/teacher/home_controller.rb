class Teacher::HomeController < TeacherController

  def dashboard
    if !current_teacher.active?
      render 'teacher/shared/inactive_message'
      return
    end

    @earliest_hour, @latest_hour, @availabilities_datetime = AvailabilityService.new(current_teacher).calendar_info

    @next_scheduled_appointment = current_teacher.next_scheduled_appointment
    @uncompleted_appointments   = current_teacher.uncompleted_appointments
  end
end
