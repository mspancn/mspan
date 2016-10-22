class ChangeAppointmentCostToDecimal < ActiveRecord::Migration[5.0]
  def change
    change_column :appointments, :cost, :decimal, precision: 9, scale: 2
  end
end
