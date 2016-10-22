class CommissionService

  PERCENTAGE = {
    0..19   => 0.7,
    20..49  => 0.74,
    50..199 => 0.78,
    200..876000 => 0.8
  }

  def initialize(appointment)
    @appointment = appointment
  end

  def cost
    percentage = PERCENTAGE.detect { |range, percentage|
      range === @appointment.teacher.completed_appointments.count
    }.last

    (@appointment.teacher_rate * percentage).round(2)
  end
end
