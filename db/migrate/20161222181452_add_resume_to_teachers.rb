class AddResumeToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_attachment :teachers, :resume
  end
end
