class AddIntroToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :intro, :string
  end
end
