class Student::AppointmentsController < ApplicationController

  def new
    time_slots = Teacher.find(params[:teacher_id])
      .availabilities_between(Time.now, 7.days.from_now)
      .map(&:time_slots).flatten

    @grouped_time_slots = time_slots.group_by do |ts|
      ts.strftime("%m-%d")
    end
  end
end