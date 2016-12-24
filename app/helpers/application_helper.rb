module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end

  def time_from_hour(hour)
    "#{sprintf('%02d', hour)}:00:00"
  end

  def teacher_format(time)
    time.strftime("%a, %m/%d %I:%M%P")
  end

  def student_format(time)
    time.strftime("%m-%d %H:%M")
  end

  def appointment_time_slot_classes(availability_start, appointments, current_student)
    classes = "btn btn-default appointment-time-slot"

    if appointment = appointments.find { |app| app.scheduled_start == availability_start }
      classes += classes + " disabled"
      if current_student.id == appointment.student_id
        classes += classes + " btn-success success-border"
      else
        classes += classes + " disabled-border"
      end
    end

    classes
  end

  def student_appointment_list_title(state)
    case state
    when "new"
      "预约的课程"
    when "canceled"
      "取消的课程"
    when "completed"
      "完成的课程"
    end
  end

  def teacher_appointment_list_title(state)
    case state
    when "new"
      "Scheduled"
    when "canceled"
      "Canceled"
    when "completed"
      "Completed"
    end
  end

  def google_analytics_js
    <<-EOS.html_safe
      <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-86757428-1', 'auto');
        ga('send', 'pageview');
      </script>
    EOS
  end
end
