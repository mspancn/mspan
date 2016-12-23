class AddIntroToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :intro, :text
  end
end
