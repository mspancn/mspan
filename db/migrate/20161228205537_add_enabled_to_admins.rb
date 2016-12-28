class AddEnabledToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :enabled, :boolean
  end
end
