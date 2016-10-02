class AddNamesToTeachersAndStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :first_name, :string, null: false
    add_column :teachers, :last_name, :string, null: false
    add_column :students, :full_name, :string
  end
end
