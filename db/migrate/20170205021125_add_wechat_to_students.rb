class AddWechatToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :wechat, :string
  end
end
