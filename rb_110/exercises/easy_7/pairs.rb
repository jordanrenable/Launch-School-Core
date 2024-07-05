=begin
write a method that takes two array arguments in which each array contains a list
of numbers, and returns a new array that contains the product of every pair of
numbers that can be formed between the elements of the two arrays
the results should be sorted by increasing value
assume neither argument is empty

take two arrays
iterate over the first array
for each element, multiply that element by each of the elements in the second 
array by iterating over the second array
push each of the results to a new array

lastly sort the new array in increasing order

def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |num|
    arr2.each do |el|
      products << el * num
    end
  end
  products.sort
end

=end

def multiply_all_pairs(arr1, arr2)
  arr1.each_with_object([]) do |num, result|
    arr2.each { |el| result << el * num }
  end.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]