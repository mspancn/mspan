class AddNotesToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :notes, :text
  end
end
