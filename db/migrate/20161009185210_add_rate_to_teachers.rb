class AddRateToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :rate, :integer, null: false
  end
end
