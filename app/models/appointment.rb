class Appointment < ApplicationRecord
  extend Enumerize

  audited

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
    update_attributes!(state: :canceled, in_use: nil)
  end

  def complete
    update_attributes!(state: :completed)
  end

  private

    def set_defaults
      self.state = :new
      self.in_use = true
      self.scheduled_end = scheduled_start + LENGTH
    end
end
