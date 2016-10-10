class AddBalanceToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :balance, :integer, null: false
  end
end
