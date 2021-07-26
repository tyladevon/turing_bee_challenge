# This CreditCard class is intended to give a simple way to store
# credit card numbers after they are validated.

class CreditCard   
  def initialize(number)
    @number = number
  end

  def valid?
    NumberValidation.check(@number)
  end
end
