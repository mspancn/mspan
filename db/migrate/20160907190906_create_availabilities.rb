class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.integer :start, null: false
      t.integer :end, null: false
      t.integer :weekly_repeat, limit: 1, null: false, default: 0
      t.integer :teacher_id, null: false

      t.timestamps
    end
  end
end
