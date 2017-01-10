class CommissionService

  PERCENTAGE = {
    0..10       => 0.7,
    11..50      => 0.73,
    51..150     => 0.76,
    151..300    => 0.79,
    301..876000 => 0.82
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
