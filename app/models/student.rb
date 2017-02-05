class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  audited only: [:balance]

  has_and_belongs_to_many :teachers
  has_many :appointments

  has_attached_file :avatar, Rails.application.config.attached_file_options.merge({
    styles: { medium: "150x150>" },
    path: "avatar/student/:id/:basename.:extension",
    default_url: "no_profile_image.jpg"
  })
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/png"], message: "must be jpeg/png" },
    size: { in: 0..300.kilobytes, message: "must be less than 300 kilobytes" }

  before_create :set_defaults

  AGE_RANGES = ["0-15", "15-18", "19-25", "26-30", "30+"]

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

  def booked?(scheduled_start)
    appointments
      .where(scheduled_start: scheduled_start)
      .where('state <> ?', "canceled")
      .exists?
  end

  def profile_completed?
    full_name.present? and preferred_teacher_type.present? and
      preferred_teacher_gender.present? and purposes.present? and
      wechat.present?
  end

  def withdrawal(amount)
    self.with_lock do
      raise "Low Balance" if balance < amount
      self.balance -= amount
      save!
    end
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
      self.full_name ||= NameGenerator.first_name
    end
end
