class AddTimeZoneToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :time_zone, :string, null: false, default: 'Eastern Time (US & Canada)'
  end
end
