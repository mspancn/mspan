class Student::AppointmentsController < ApplicationController

  def new
    @teacher = Teacher.find(params[:teacher_id])
    time_slots = @teacher.availabilities_between(Time.now, 7.days.from_now)
      .map(&:time_slots).flatten

    @grouped_time_slots = time_slots.group_by do |ts|
      ts.strftime("%m-%d")
    end
  end

  def create
    @start = DateTime.parse(params[:start])
    current_student.appointments.create(
      teacher: Teacher.find(params[:teacher_id]),
      scheduled_start: @start,
      creator: current_student
    )
  end
end