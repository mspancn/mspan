class AvailabilityService

  def initialize(teacher)
    @teacher = teacher
  end

  def calendar_info
    availabilities = @teacher.availabilities_next_7_days
    availabilities_datetime = availabilities.map(&:to_datetime_json)

    time_slots = availabilities.map(&:time_slots).flatten
    earliest_hour  = time_slots.map(&:hour).min || 9
    latest_hour    = time_slots.map(&:hour).max.try(:+, 1) || 17

    [earliest_hour, latest_hour, availabilities_datetime]
  end
end
