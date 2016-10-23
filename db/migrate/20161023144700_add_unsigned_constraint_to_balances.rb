class AddUnsignedConstraintToBalances < ActiveRecord::Migration[5.0]
  def change
    change_column :students, :balance, 'integer unsigned', null: false
    change_column :teachers, :balance, 'integer unsigned', null: false
  end
end
