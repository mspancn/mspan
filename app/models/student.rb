class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teachers
  has_many :appointments

  before_create :set_defaults

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
