class Appointment < ApplicationRecord
  extend Enumerize

  enumerize :state, in: [:new, :canceled, :completed]

  belongs_to :teacher
  belongs_to :student
  belongs_to :creator, polymorphic: true

  FREEZE_WINDOW = 24.hours
  LENGTH = 45.minutes

  before_create :set_defaults

  def cancelable?
    state.new? and scheduled_start > FREEZE_WINDOW.from_now
  end

  def not_started?
    state.new? and scheduled_end > Time.current
  end

  def ongoing?
    state.new? and scheduled_start <= Time.current and scheduled_end > Time.current
  end

  def uncompleted?
    state.new? and scheduled_end < Time.current
  end

  def cancel
    if cancelable?
      update_attributes(state: :canceled, in_use: nil)
    else
      false
    end
  end

  def complete
    if uncompleted?
      update_attributes(state: :completed)
    else
      false
    end
  end

  private

    def set_defaults
      self.state ||= :new
      self.scheduled_end = scheduled_start + LENGTH
    end
end
