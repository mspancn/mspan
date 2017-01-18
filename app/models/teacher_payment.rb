class TeacherPayment < ApplicationRecord
  belongs_to :teacher
  belongs_to :creator, polymorphic: true

  # NOTE: explicitly defined for joins
  belongs_to :admin, -> { where(teacher_payments: {creator_type: 'Admin'}) }, foreign_key: 'creator_id'
end
