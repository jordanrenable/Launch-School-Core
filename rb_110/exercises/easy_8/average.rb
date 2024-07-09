=begin
write a method that takes one array of integers as an argument and returns the 
average of all numbers in the array
the array will never be empty and the numbers will always be positive integers
your result should be an integer

don't use the array.sum method! solve the problem using iteration more directly

=end

def average(array)
  sum = 0.0
  size = 0
  array.each do |num| 
    sum += num
    size += 1
  end
  p (sum / size).round(2)
end


puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40