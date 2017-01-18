class StudentPaymentService

  def initialize(payment)
    @payment = payment
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        @payment.save!
        @payment.student.deposit(@payment.amount)
      end
    rescue Exception => e
      return { error: "Error." }
    end

    @payment
  end
end
