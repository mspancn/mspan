class Teacher::HomeController < ApplicationController
  before_action :authenticate_teacher!

  def dashboard
    @availabilities = Availability.all.map(&:to_datetime_json)
    @earliest =
      @availabilities.map { |a|
        a["start"].strftime("%H:%M:%S")
      }.min_by { |t|
        Time.parse(t).hour
      }
    @latest =
      @availabilities.map { |a|
        a["end"].strftime("%H:%M:%S")
      }.max_by { |t|
        Time.parse(t).hour
      }
  end
end
