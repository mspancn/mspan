class Admin::TeacherPaymentsController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data:
        TeacherPayment.joins(:teacher).joins(:admin).select("
          teacher_payments.id,
          concat(teachers.first_name, ' ', teachers.last_name) AS teacher_name,
          teachers.email AS teacher_email,
          teacher_payments.amount,
          teacher_payments.created_at,
          admins.email AS creator_email
        ")
      }
    end
  end

  def new
    @teachers = Teacher.where('balance > 0')
  end

  def create
    teacher = Teacher.find(params[:teacher_id])

    @payment = TeacherPaymentService.new(
      TeacherPayment.new(
        teacher: teacher,
        creator: current_admin
      )
    ).create

    if @payment[:error]
      render 'shared/error', locals: { error: @payment[:error] }
      return
    end
  end
end
