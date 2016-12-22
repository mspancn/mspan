class AddAgeGenderSpeechVideoToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :gender, :string
    add_column :teachers, :age_range, :string
    add_column :teachers, :speech_video, :string
  end
end
