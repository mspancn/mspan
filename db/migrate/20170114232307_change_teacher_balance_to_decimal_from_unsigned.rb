class ChangeTeacherBalanceToDecimalFromUnsigned < ActiveRecord::Migration[5.0]
  def change
    change_column :teachers, :balance, :decimal, precision: 9, scale: 2, null: false
  end
end
