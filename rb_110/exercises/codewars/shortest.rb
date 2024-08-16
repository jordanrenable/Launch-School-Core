=begin
Write a method that takes two inputs: an array of positive integers, and a 
positive integer. The method should return the shortest length of a subarray of 
consecutive elements from the input array for which the sum of its numbers is 
greater than or equal to the input integer. If no such subarray exists, return 0

Examples:
p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2   # [4, 2]
p shortest_length([1, 10, 5, 2, 7], 9) == 1     # [10]
p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4 # [100, 1, 0, 200]
p shortest_length([1, 2, 4, 1], 8) == 4     # [1, 2, 4, 1]
p shortest_length([1, 2, 4], 8) == 0
p shortest_length([], 1) == 0


PROBLEM
input: an array of positive integers AND a positive integer

output: an integer
  - the shortest length of a subarray of consecutive elements that has a sum greater than or equal to the input integer
  - return 0 if none of the subarray sums are greater than or equal to the input integer

  if an input array is 0, return 0

EXAMPLES
  -

DATA STRUCTURES
  input: array of integers and integer
    array of subarrays
  output: integer

ALGORITHM
take an array of positive integers
initialize an array to contain subarrays
  initialize an array of possible solutions
obtain and store the subarrays of all consecutive numbers from the input array in the subarrays array

  - iterate over the integers, starting from the first index
  for each element in the array, iterate over the remainder of the array
    on the first iteration, subarray should consist of index 0-0
    second iteration should consist of index 0-1
    third iteration should consist of index 0-2
    fourth iteration should consist of index 0-3
    fifth iteration should consist of index 0-4
    sixth iteration should consist of index 0-5
    (final iteration should be the size of the input array - 1)
    (if size of array is 6, final iteration would be 5)
    (for first element in the array, total iterations is equal to the array size: 0-5 -- also equals the size - index!)
  for next element in the array, start index will be 1
    (for second element in the array, total iterations is equal to the size - the index)
    iterate over the remainder of the array
    first iteration will be index 1-1
    second iteration will be index 1-2
    third iteration will be index 1-3
    fourth iteration will be index 1-4
    fifth iteration will be index 1-5
  third element in array
    1st- 2-2
    2nd- 2-3
    3rd- 2-4
    4th- 2-5

check to see which of the subarrays have a sum >= input integer
- push these to a new array of possible solutions
from the possible solutions, find the smallest one and return its size
if possible solutions is empty, return 0


=end

def shortest_length(array, integer)
  subarrays = []
  solutions = []
 
  subarrays = find_subarrays(array)
  
  subarrays.each { |sub| solutions << sub if sub.sum >= integer }
  
  solutions = solutions.sort_by { |sub| sub.size }

  solutions.empty? ? 0 : solutions.first.size
end

def find_subarrays(array)
  subs = []
  last_index = (array.size - 1)
  array.each_with_index do |el, index|
    index.upto(last_index) do |iteration|
      subs << array[index..iteration]
    end
  end
  subs
end

p shortest_length([2, 3, 1, 2, 4, 3], 7) == 2   # [4, 3]
p shortest_length([1, 10, 5, 2, 7], 9) == 1     # [10]
p shortest_length([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4     # [100, 1, 0, 200]
p shortest_length([1, 2, 4, 1], 8) == 4     # [1, 2, 4, 1]
p shortest_length([1, 2, 4], 8) == 0
p shortest_length([], 1) == 0