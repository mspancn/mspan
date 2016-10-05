class AppointmentService

  def initialize(teacher, student, start, creator)
    @teacher, @student, @start, @creator = teacher, student, start, creator
  end

  def create
    if @teacher.booked?(@start) ||
      !@teacher.available?(@start) ||
      @student.booked?(@start)
      return { error: "Not available anymore." }
    end

    if @start < Time.now
      return { error: "Can't make appointment for the past." }
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
