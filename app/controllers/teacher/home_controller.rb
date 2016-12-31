class Teacher::HomeController < TeacherController

  def dashboard
    if !current_teacher.active?
      render 'teacher/shared/inactive_message'
      return
    end

    availabilities = current_teacher.availabilities_next_7_days
    @availabilities_datetime = availabilities.map(&:to_datetime_json)

    time_slots = availabilities.map(&:time_slots).flatten
    @earliest_hour  = time_slots.map(&:hour).min || 9
    @latest_hour    = time_slots.map(&:hour).max.try(:+, 1) || 17

    @next_scheduled_appointment = current_teacher.next_scheduled_appointment
    @uncompleted_appointments   = current_teacher.uncompleted_appointments
  end
end
