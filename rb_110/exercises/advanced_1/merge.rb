=begin
Write a method that takes two sorted Arrays as arguments, and returns a new 
Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You 
must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

PROBLEM
input- multiple arrays
output- single array with all the elements from each array in sorted order
RULES- cannot call sort or manually sort on a combined array
MUST build the array one element at a time
DO NOT MUTATE original

EXAMPLES

DATA STRUCTURES
input- arrays
intermediate- duplicates of original arrays? 
output- array

ALGORITHM
take multiple arrays
if either starting array is empty, return the other array
duplicate the arrays?
initialize an empty results array
compare the first value in the first array to the first value in the second array
  - append whichever is lower to the results array
  - remove the lower result from its array
repeat the above process
need a solution for when a call returns nil

=end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]