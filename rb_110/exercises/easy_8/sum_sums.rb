=begin
write a method that takes an array of numbers and returns the sum of the sums
of each leading subsequence for that array
assume the array contains at least one number

take an array of numbers
initiate a sum variable with a value of 0

starting with the first number in the array, add that number to the sum
for the second number, add both the first and second numbers to the sum
for the third number, add the first, second, and third numbers to the sum

iterate the number of times as the size of the array
iteration 1- sum first number (0...1)- add to total
iteration 2- sum first and second (0...2)- add to total

data
input array
output integer
interim- variable total?


def sum_of_sums(array)
  total = 0
  1.upto(array.size) { |iteration| total += array[0...iteration].sum }
  total
end

=end

def sum_of_sums(array)
  total = 0
  array.inject(0) do |memo, el|
    total += (memo + el)
    memo + el
  end
  total
end
  
p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35