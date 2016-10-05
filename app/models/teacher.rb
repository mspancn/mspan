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

  def availabilities_between(start_date, end_date)
    availabilities.where('start > ? and end < ?', start_date.to_i, end_date.to_i)
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
