class Admin::StudentPaymentsController < AdminController
  load_and_authorize_resource

  def index
    if request.xhr?
      render json: { data:
        StudentPayment.joins(:student).joins(:admin).select("
          student_payments.id,
          students.full_name AS student_name,
          students.email AS student_email,
          student_payments.amount,
          student_payments.created_at,
          admins.email AS creator_email
        ")
      }
    end
  end

  def new
  end

  def create
    student = Student.where(email: params[:email]).first

    if student.blank?
      flash[:error] = "Student doesn't exist"
      render "new"
      return
    end

    @payment = StudentPaymentService.new(
      StudentPayment.new(
        student: student,
        amount: params[:amount],
        creator: current_admin
      )
    ).create

    if @payment[:error]
      flash[:error] = "Payment failed"
      render "new"
      return
    end

    flash[:notice] = "Payment Created Successfully"
    redirect_to admin_student_payments_path
  end
end
