class AddIndexToAvailabilities < ActiveRecord::Migration[5.0]
  def change
    add_index :availabilities, [:teacher_id, :start, :end], unique: true
  end
end
