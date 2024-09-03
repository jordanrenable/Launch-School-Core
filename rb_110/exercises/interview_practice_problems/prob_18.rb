=begin
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

PROBLEM
input- array of integers
output- integer, representing the index for which the sum of all elements on the left is equal to the sum of all elements on the right

EXAMPLES


DATA STRUCTURES
input- array
intermediate- variables for left side and right side
output- integer

ALGORITHM
take an array
for each index, check if the sum of the left side digits is equal to the sum of the right side digits
  establish the range- 0 to max index (max index = array size minus 1)
  if equal return the index



=end

def equal_sum_index(array)
  max_index = array.size - 1
  0.upto(max_index) do |index|
    left_side = array[0...index]
    right_side = array[(index + 1)..-1]
    return index if left_side.sum == right_side.sum
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0
p equal_sum_index([0, 2, 4, 4, 2, 3, 2]) == -1

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0