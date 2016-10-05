class Appointment < ApplicationRecord
  extend Enumerize

  enumerize :state, in: [:new, :canceled]

  belongs_to :teacher
  belongs_to :student
  belongs_to :creator, polymorphic: true

  before_create :set_defaults

  private

    def set_defaults
      self.state ||= :new
      self.scheduled_end = scheduled_start + 45.minutes
    end
end
