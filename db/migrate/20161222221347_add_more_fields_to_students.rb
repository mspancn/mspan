class AddMoreFieldsToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :age_range, :string
    add_column :students, :preferred_teacher_type, :string
    add_column :students, :preferred_teacher_gender, :string
    add_column :students, :purposes, :string
  end
end
