# https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models
module Accessible
  extend ActiveSupport::Concern

  protected

  def check_user
    flash.clear
    if current_admin
      redirect_to(admin_root_path) && return
    elsif current_teacher
      redirect_to(teacher_root_path) && return
    elsif current_student
     redirect_to(student_root_path) && return
    end
  end
end
