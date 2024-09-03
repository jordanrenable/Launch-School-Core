=begin
write a method that takes an array of integers as an argument. the method should return the minimum sum of 5 consecutive numbers in the array. if the array contains fewer than 5 elements, return nil

PROBLEM
input: array of integers

output: integer or nil
  - integer representing the smallest sum from 5 consecutive numbers in the array

5 elements- 1 possible sum/subarr- index 0-4- last idx 0
6 elements- 2 possible sums/subarr- index 0-5 last idx 1
7 elements- 3 possible sums/subarr- index 0-6 last idx 2

EXAMPLES

DATA STRUCTURES
input- array
variable array for possible 5 element subarrays
output- integer or nil

ALGORITHM
take an array
return nil if array size is less than 5
initialize subarrays var
find all 5 consecutive element subarrays and put them in a new array
  iterate over the original array
  slice the array from current index with a length 5 and push to subarrays array
of the possible subarrays, find the one with the lowest sum and return that number
  minby method?
=end

def minimum_sum(array)
  return nil if array.size < 5
  subarrs = []
  max_index = array.size - 5
  0.upto(max_index) do |index|
    subarrs << array.slice(index, 5)
  end
  subarrs.min_by { |sub| sub.sum }.sum
end 

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10