class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities
  has_many :appointments

  def full_name
    "#{first_name} #{last_name}"
  end

  def availabilities_between(start_time, end_time)
    availabilities.where(start: start_time.to_i..end_time.to_i)
      .or(availabilities.where(end: start_time.to_i..end_time.to_i))
      .or(availabilities.where('start < ? and end > ?', start_time.to_i, end_time.to_i))
  end

  def availabilities_next_7_days
    availabilities_between(Time.zone.today.to_time, 7.days.from_now.midnight)
  end

  def recent_availabilities
    availabilities_between(Time.now + 2.hours, 7.days.from_now.midnight)
  end

  def appointments_between(start_time, end_time)
    appointments.where('scheduled_start between ? and ?', start_time, end_time)
  end

  def recent_appointments
    appointments_between(Time.now + 2.hours, 7.days.from_now.midnight).where(state: :new)
  end

  def scheduled_appointments
    appointments.where(state: :new)
  end

  def next_scheduled_appointment
    scheduled_appointments.where('scheduled_start > ?', Time.now).order(:scheduled_start).first
  end

  def uncompleted_appointments
    scheduled_appointments.where('scheduled_end < ?', Time.now)
  end

  def completed_appointments
    appointments.where(state: :completed)
  end

  def canceled_appointments
    appointments.where(state: :canceled)
  end

  def booked?(time)
    appointments
      .where(scheduled_start: time)
      .where('state <> ?', "canceled")
      .exists?
  end

  def available?(time)
    availabilities.where('start <= ? and end > ?', time.to_i, time.to_i)
  end
end
