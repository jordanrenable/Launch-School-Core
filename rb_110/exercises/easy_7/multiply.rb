=begin
write a method that takes two arrays in which each array contains a list of 
numbers, and returns a new array that contains the product of each pair of 
numbers from the arguments that have the same index
assume the arguments have the same number of elements


take two arrays
create a new array containing the paired index numbers?
then multiply each pair together?
=end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |sub| sub.inject(:*) }
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]