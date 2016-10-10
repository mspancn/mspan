class AddBalanceToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :balance, :integer, null: false
  end
end
