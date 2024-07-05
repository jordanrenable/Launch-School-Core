=begin
Write a method that takes two Arrays as arguments, and returns an Array that 
contains all of the values from the argument Arrays. There should be no 
duplication of values in the returned Array, even if there are duplicates in the 
original Arrays.


Algorithm
iterate over each array
append each element into a new array

SCRATCH THAT- PLUS IS EASIER

eliminate duplicates in the new array

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end
=end

def merge(*arrays)
  arrays.inject(:+).uniq
end


p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge([1, 2, 3], [3, 4, 5], [5, 6, 7]) == [1, 2, 3, 4, 5, 6, 7]