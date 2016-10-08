class AppointmentService

  def initialize(teacher, student, start, creator)
    @teacher, @student, @start, @creator = teacher, student, start, creator
  end

  def create
    if @start < Appointment::FREEZE_WINDOW.from_now
      return { error: "Can't make an appointment within 24 hours." }
    end

    if @teacher.booked?(@start) ||
      !@teacher.available?(@start) ||
      @student.booked?(@start)
      return { error: "Not available anymore." }
    end

    begin
      appointment = Appointment.create!(
        teacher: @teacher,
        student: @student,
        scheduled_start: @start,
        creator: @creator
      )
    rescue Exception => e
      return { error: "Error." }
    end

    appointment
  end
end
