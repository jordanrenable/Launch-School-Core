=begin
Create a method that takes an array of numbers, all of which are the same except 
one. Find and return the number in the array that differs from all the rest.

The array will always contain at least 3 numbers, and there will always be 
exactly one number that is different.

PROBLEM
input- array of integers
output- integer, which is the lone one of its kind within the array

EXAMPLES

DATA STRUCTURES
input- array
intermediate- 
output- integer

ALGORITHM

take an array
return the integer which only occurs 1 time in the array

which integer occurs only once?

=end

def what_is_different(array)
  array.each do |int|
    return int if array.count(int) == 1
  end
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3