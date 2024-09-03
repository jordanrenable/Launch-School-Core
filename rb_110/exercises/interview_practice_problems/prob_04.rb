=begin
Create a method that takes an array of integers as an argument and returns an 
array of two numbers that are closest together in value. If there are multiple 
pairs that are equally close, return the pair that occurs first in the array.


PROBLEM
given an array of integers
find all the possible pairs
find the pairs with the minimum difference in value
return the pair with the minimum difference that also comes first in the array

EXAMPLES

DATA STRUCTURES
input- array
intermediate- 
output- array

ALGORITHM
given an array of integers
find all the possible pairs (helper method)
  - initialize variable array to store pairs
  - iterate over each element
    - for each element, iterate over the remainder of the array taking the 
    element from the working index and the element from the "next" index and 
    storing them as a pair
    1st iteration
    - index 0- iterate from index + 1 to array size - 1
      - pair array[0] + array[1]
      - pair array[0] + array[2]
      - pair array[0] + array[3]
      - pair array[0] + array[4]
    - index 1- iterate from index + 1 to array size - 1
      - pair array[index] + array[iteration]
      - pair array[1] + array[3]
      - pair array[1] + array[4]


find the pairs with the minimum difference in value (helper method)
- take an array of pairs
- assign a variable to track the lowest difference
- assign a variable to hold the closest pairs
- iterate over the array of pairs
- for each pair, find the difference between the numbers
  - on the first iteration, the pair will need to be stored in the closest pairs
  array
  - for each subsequent pair, check if the difference is the same, higher,  or
  lower than the stored pairs difference.
  - if the difference is higher, go to the next pair
  - if the difference is the same, add that pair to the closest array
  - if the difference is lower, clear the closest array, add the new pair to the 
  closest array, and reassign the lowest difference to the new lowest difference

return the pair with the minimum difference that also comes first in the array

=end

def find_all_pairs(array)
  pairs = []
  max_index = array.size - 1
  0.upto(max_index - 1) do |first_idx|
    (first_idx + 1).upto(max_index) do |second_idx|
      pairs << [array[first_idx]] + [array[second_idx]]
    end
  end
  pairs
end

def closest_numbers(array)
  pairs = find_all_pairs(array)
  pairs.min_by { |pair| (pair[0] - pair[1]).abs }
end


p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]
