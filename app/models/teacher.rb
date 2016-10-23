class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  audited only: [:rate, :balance, :notes, :active]

  validates :first_name, :last_name, :phone, :major, :degree, :speech_video,
    :teaching_experience, :referral, :internationalization_experience, :resume,
    presence: true
  validates_inclusion_of :student, :certificate, :mandarin, in: [true, false]
  validates_inclusion_of :rate, in: ExchangeService::DOLLAR_TO_YUAN.keys

  has_many :availabilities
  has_many :appointments

  has_attached_file :resume, Rails.application.config.attached_file_options.merge({
    path: "resume/:id/:basename.:extension"
  })
  # TODO: remove duplicate error messages for resume
  validates_attachment :resume, presence: true,
    content_type: { content_type: "application/pdf", message: "must be pdf" },
    size: { in: 0..1.megabytes, message: "must be less than 1 megabytes" }

  before_validation :set_default_rate
  before_create :set_defaults

  AGE_RANGES = ["18-22", "22-25", "25-35", "35-50", "50+"]

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
    availabilities_between(Appointment::FREEZE_WINDOW.from_now, 7.days.from_now.midnight)
  end

  def schedulable_time_slots
    recent_availabilities.map(&:time_slots).flatten.select do |time_slot|
      time_slot.between?(Appointment::FREEZE_WINDOW.from_now, 7.days.from_now.midnight)
    end.sort
  end

  def appointments_between(start_time, end_time)
    appointments.where('scheduled_start between ? and ?', start_time, end_time)
  end

  def recent_appointments
    appointments_between(Appointment::FREEZE_WINDOW.from_now, 7.days.from_now.midnight).where(state: :new)
  end

  def scheduled_appointments
    appointments.where(state: :new)
  end

  def next_scheduled_appointment
    scheduled_appointments.where('scheduled_start > ?', Time.current).order(:scheduled_start).first
  end

  def uncompleted_appointments
    scheduled_appointments.where('scheduled_end < ?', Time.current)
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
    availabilities.where('start <= ? and end > ?', time.to_i, time.to_i).exists?
  end

  def deposit(amount)
    self.with_lock do
      self.balance += amount
      save!
    end
  end

  private

    def set_defaults
      self.balance ||= 0
    end

    def set_default_rate
      self.rate ||= default_rate
    end

    def default_rate
      if self.certificate?
        30
      elsif self.mandarin?
        25
      else
        20
      end
    end
end
