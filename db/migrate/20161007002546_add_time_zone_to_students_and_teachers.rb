class AddTimeZoneToStudentsAndTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :time_zone, :string, null: false, default: 'Beijing'
    add_column :teachers, :time_zone, :string, null: false, default: 'Eastern Time (US & Canada)'
  end
end
