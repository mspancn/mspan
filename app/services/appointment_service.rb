class AppointmentService

  def initialize(appointment)
    @appointment = appointment
  end

  def create
    start = @appointment.scheduled_start
    if start < Appointment::FREEZE_WINDOW.from_now
      return { error: "不能预约24小时以内课程。" }
    end

    if @appointment.teacher.booked?(start) ||
      !@appointment.teacher.available?(start) ||
      @appointment.student.booked?(start)
      return { error: "老师或学生不再可约。" }
    end

    amount = @appointment.teacher.rate

    if @appointment.student.balance <  amount
      return { error: "余额不足，请联系管理员。" }
    end

    begin
      ActiveRecord::Base.transaction do
        @appointment.price = amount
        @appointment.save!
        @appointment.student.withdrawal(amount)
      end
    rescue Exception => e
      return { error: "Error." }
    end

    @appointment
  end

  def cancel(canceled_by)
    if !@appointment.cancelable?
      error = canceled_by == @appointment.student ? "不能取消24小时以内或者已完成预约。" : "Can't cancel an appointment within 24 hours."
      return { error: error }
    end

    begin
      ActiveRecord::Base.transaction do
        @appointment.cancel
        @appointment.student.deposit(@appointment.price)
      end
    rescue Exception => e
      return { error: "Error." }
    end

    @appointment
  end

  def complete
    if !@appointment.uncompleted?
      return { error: "该预约不能完成。" }
    end

    @appointment.complete
    @appointment
  end
end
