class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :student_id, null: false
      t.integer :teacher_id, null: false

      t.datetime :scheduled_start, null: false
      t.datetime :scheduled_end, null: false

      t.string  :state, null: false

      t.string :creator_type, null: false
      t.integer :creator_id, null: false

      t.timestamps
    end

    add_index :appointments, [:student_id, :scheduled_start], unique: true
    add_index :appointments, [:teacher_id, :scheduled_start], unique: true

    add_index :appointments, [:student_id, :state, :scheduled_start]
    add_index :appointments, [:teacher_id, :state, :scheduled_start]
  end
end
