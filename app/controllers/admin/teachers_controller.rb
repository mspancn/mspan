class Admin::TeachersController < AdminController
  # TODO: audit teachers
  # TODO: audit students
  # TODO: audit appointments
  # TODO: move library assets to vendors
  # TODO: teacher updates
  # TODO: sign up email for teachers
  # TODO: sign up email for students
  # TODO: memcached
  # TODO: cancancan for admin
  # TODO: teacher active
  # TODO: cancancan for teacher
  # TODO: cancancan for student
  # TODO: accessible https://github.com/plataformatec/devise/wiki/How-to-Setup-Multiple-Devise-User-Models

  def index
    if request.xhr?
      render json: { data: Teacher.select("id, first_name, last_name, email") }
    end
  end
end
