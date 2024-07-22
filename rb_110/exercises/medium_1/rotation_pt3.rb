def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  all_digits = number.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join
end

def max_rotation(integer)
  size = (integer.digits.size) - 1
  size.times do |index|
    digits = integer.to_s.chars
    first = digits[0...index].join
    last = digits[index..-1]
    number = last.join
    last = rotate_rightmost_digits(number, last.size)
    integer = (first + last)
  end
  integer.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845


=begin
def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end
=end