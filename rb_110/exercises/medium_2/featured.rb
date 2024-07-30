=begin
for this exercise, a featured number is an odd number that is a multiple of 7,
and whose digits occur exactly once each

write a method that takes a single integer and returns the next featured number
that is greater than the argument
return an error message if there is no next featured number

starting multiple will be integer divided by 7 rounded up to the next whole num
and remultiplied by 7

check starting number to see if it qualifies
if it does, return it, if not, add 7 to the number and check again


def featured(int)
  multiple = (int / 7.0).round(0) * 7
  multiple += 7 if multiple == int

  loop do
    break if multiple.odd? && multiple.digits.uniq == multiple.digits
    multiple += 7
  end
  multiple
end
=end

def featured(int)
  multiple = (int / 7.0).round(0) * 7
  multiple += 7 if multiple == int
  multiple += 7 if multiple.even?

  loop do
    return multiple if multiple.digits.uniq == multiple.digits
    multiple += 14
    break if multiple > 9876543210
  end
  "No possible number."
end



p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements