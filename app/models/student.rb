class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :teachers

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
end
