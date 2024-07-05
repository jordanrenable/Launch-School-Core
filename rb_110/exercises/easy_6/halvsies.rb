=begin
write a method that takes an array as an argument and returns two arrays (as a 
pair of nested arrays) that contains the first half and second half of the 
original array, respectively. if the original array contains an odd number of
elements, the middle element should go in the first half array.

Algorithm
take an array
establish how many elements are in the array

divide the size by 2.0(division by integer will return the number rounded down)
round the return up to the nearest integer- this is our split point

take elements 0..split point to first array
take split point plus 1 - last element into second array

=end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  [array[0...middle], array[middle..-1]]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]



