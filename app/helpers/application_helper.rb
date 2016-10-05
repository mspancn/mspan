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
end
