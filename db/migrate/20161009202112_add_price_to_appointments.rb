class AddPriceToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :price, :integer, null: false
  end
end
