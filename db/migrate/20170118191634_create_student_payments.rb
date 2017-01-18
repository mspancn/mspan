class CreateStudentPayments < ActiveRecord::Migration[5.0]
  def change
    create_table :student_payments do |t|
      t.integer :student_id, null: false
      t.column :amount, 'integer unsigned', null: false

      t.string :creator_type, null: false
      t.integer :creator_id, null: false

      t.timestamps
    end
  end
end
