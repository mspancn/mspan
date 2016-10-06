class AddInUseToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :in_use, :boolean, default: true

    remove_index :appointments, [:student_id, :scheduled_start]
    remove_index :appointments, [:teacher_id, :scheduled_start]

    add_index :appointments, [:student_id, :scheduled_start, :in_use], unique: true, :name => 'index_student_start_in_use'
    add_index :appointments, [:teacher_id, :scheduled_start, :in_use], unique: true, :name => 'index_teacher_start_in_use'
  end
end
