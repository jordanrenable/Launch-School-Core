=begin
write a method that computes the difference between the square of the sum of the
first n positive integers and the sum of the squares of the first n positive
integers
=end

def sum_square_difference(int)
  sum_square = ((1..int).sum)**2
  square_sum = 0
  (1..int).each { |num| square_sum += num**2 }
  sum_square - square_sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150