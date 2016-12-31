class AddMoreFieldsToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :phone, :string
    add_column :teachers, :major, :string
    add_column :teachers, :degree, :string
    add_column :teachers, :student, :boolean
    add_column :teachers, :teaching_experience, :string
    add_column :teachers, :certificate, :boolean
    add_column :teachers, :mandarin, :boolean
    add_column :teachers, :internationalization_experience, :string
    add_column :teachers, :referral, :string
  end
end
