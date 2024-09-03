=begin
create a method that takes an array of numbers as an argument. for each number,
determine how many numbers in the array are smaller than it, and place the
answer in an array. return the resulting array

when counting numbers, only count unique values. that is, if a number occurs
multiple times in the array, it should only be counted once.

PROBLEM
input: array of integers
output: array of integers
  - where each number in the result array represents the number of integers in 
  the original array that are smaller than the number in the current index
  -numbers should only be counted once!
  
EXAMPLES

DATA STRUCTURES
input array
working array variable
working int variable
output array

ALGORITHM
given an array
iterate over each integer
start at index 0
working number is integer at index 0
evaluate the rest of the array (less the working num)
eliminate duplicate values in the working array
check each number to see if it is smaller than the working number
if it is, increment a counter? (may use count method)

  to create working array
  array[0...index] + array[(index+1)..-1]


return the results array

=end


def smaller_numbers_than_current(array)
  array.map.with_index do |el, index|
    working_array = array[0...index] + array[(index+1)..-1]
    working_array.uniq.count { |num| num < el }
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result

p my_array