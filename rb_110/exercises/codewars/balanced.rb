=begin
write a method that returns the index of the number where the sum of the numbers 
in the left side of the array are equal to the sum of the numbers in the right 
side of the array. an empty array = 0. 

=end

def find_even_index(array)
  left_side = nil
  right_side = nil

  array.size.times do |index|
    left_side = array[0...index]
    right_side = array[(index + 1)..-1]
    return index if left_side.sum == right_side.sum
  end
  -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3