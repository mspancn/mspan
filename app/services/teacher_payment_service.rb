class TeacherPaymentService

  def initialize(payment)
    @payment = payment
  end

  def create
    begin
      amount = @payment.teacher.balance

      ActiveRecord::Base.transaction do
        @payment.amount = amount
        @payment.save!
        @payment.teacher.withdrawal(amount)
      end
    rescue Exception => e
      return { error: "Error." }
    end

    @payment
  end
end
