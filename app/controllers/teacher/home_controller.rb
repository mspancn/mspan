class Teacher::HomeController < ApplicationController
  before_action :authenticate_teacher!

  def dashboard
    @availabilities = current_teacher
      .availabilities_between(Date.yesterday.to_time, 6.days.from_now.to_date.to_time)
      .map(&:to_datetime_json)
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
