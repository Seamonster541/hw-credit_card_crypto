# frozen_string_literal: true

# Module is used to verify credit card number with Luhn equation
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # drops the check number (most right) assuming it has a check number
    check_digit = nums_a.pop

    # reverses the array since the payload starts from the most right digit
    payload = nums_a.reverse!

    # create a new payload where each even position is doubled
    new_payload = payload.map.with_index { |n, i| double_even(n, i) }

    # create a sum of the array new_payload
    s = new_payload.sum

    # TODO: use the integers in nums_a to validate its last check digit
    # uses luhn equation to make calculation for check digit
    calc_check_digit = (10 - (s % 10)) % 10

    # verifies if there is a check digit
    calc_check_digit == check_digit
  end

  # Doubles the number and if it is greater than 9, -9.
  def double_even(n, i)
    double_n = n * 2

    if i.even?
      double_n > 9 ? double_n - 9 : double_n
    else
      n
    end
  end
end
