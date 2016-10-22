class AddTeacherRateToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :teacher_rate, :integer, null: false, after: :price
  end
end
