class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teachers
  has_many :appointments

  def add_teacher(teacher)
    if teachers.size < 3
      teachers << teacher
    else
      false
    end
  end

  def remove_teacher(teacher)
    if teachers.include?(teacher)
      teachers.delete(teacher)
    else
      false
    end
  end

  def scheduled_appointments
    appointments.where(state: "New")
  end

  def next_scheduled_appointment
    scheduled_appointments.order(:scheduled_start).last
  end
end
