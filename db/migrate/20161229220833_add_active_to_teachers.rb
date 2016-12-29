class AddActiveToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :active, :boolean, null: false, default: false
  end
end
