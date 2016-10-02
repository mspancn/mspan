class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :availabilities

  def full_name
    "#{first_name} #{last_name}"
  end

  def availabilities_between(start_date, end_date)
    availabilities.where('start > ? and end < ?', start_date.to_i, end_date.to_i)
  end
end
