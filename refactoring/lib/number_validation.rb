# This NumberValidation class is intended to validate the credit card 
# number that is passed through prior to saving it

class NumberValidation
	def self.check(number)
		array = number.split("")
    reversed = array.reverse
    doubled = reversed.map.with_index do |num, index|
      if index % 2 == 0
        num.to_i
      else
        num.to_i * 2
      end
    end
    summed = doubled.map do |num|
      if num > 9
        num - 9
      else
        num
      end
    end
    total = summed.sum
    if total % 10 == 0
      true
    else
      false
    end
  end
end 