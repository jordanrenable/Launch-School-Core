=begin

write a method that takes one argument, a positive integer, and returns the sum of its digits

["2", "3"].map(&:to_i) # => [2, 3]

=end

def sum(integer)
  integer.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45