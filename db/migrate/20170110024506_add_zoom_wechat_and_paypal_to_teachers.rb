class AddZoomWechatAndPaypalToTeachers < ActiveRecord::Migration[5.0]
  def change
    add_column :teachers, :zoom, :string
    add_column :teachers, :wechat, :string
    add_column :teachers, :paypal, :string
  end
end
