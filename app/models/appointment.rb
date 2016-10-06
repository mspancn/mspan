class Appointment < ApplicationRecord
  extend Enumerize

  enumerize :state, in: [:new, :canceled, :completed]

  belongs_to :teacher
  belongs_to :student
  belongs_to :creator, polymorphic: true

  before_create :set_defaults

  def cancel
    # TODO should not be able to cancel when it's close to start time
    if state.new?
      update_attributes(state: :canceled)
    else
      false
    end
  end

  def complete
    if state.new? and scheduled_end < Time.now
      update_attributes(state: :completed)
    else
      false
    end
  end

  private

    def set_defaults
      self.state ||= :new
      self.scheduled_end = scheduled_start + 45.minutes
    end
end
