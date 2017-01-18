class CreateTeacherPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :teacher_payments do |t|
      t.integer :teacher_id, null: false
      t.decimal :amount, precision: 9, scale: 2, null: false

      t.string :creator_type, null: false
      t.integer :creator_id, null: false

      t.timestamps
    end
  end
end
