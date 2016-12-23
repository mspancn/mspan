class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teachers
  has_many :appointments

  before_create :set_defaults

  AGE_RANGES = ["15岁以下", "15-18岁", "19-25岁", "26-30岁", "30岁以上"]

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
      preferred_teacher_gender.present? and purposes.present?
  end

  def withdrawal(amount)
    raise "Low Balance" if balance < amount
    self.balance -= amount
    save!
  end

  def deposit(amount)
    self.balance += amount
    save!
  end

  private

    def set_defaults
      self.balance ||= 0
      self.full_name ||= NameGenerator.new.first_name
    end
end
