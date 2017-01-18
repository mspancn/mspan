class StudentPayment < ApplicationRecord
  belongs_to :student
  belongs_to :creator, polymorphic: true

  # NOTE: explicitly defined for joins
  belongs_to :admin, -> { where(student_payments: {creator_type: 'Admin'}) }, foreign_key: 'creator_id'
end
