=begin
take an array of numbers, return a transformed array where each number is the
sum of that number plus the numbers before it. 

input- array
output- transformed array

rules- if input is empty array, return empty array

Algorithm
take an array
the first element in the array will be itself
the second element will be the second element plus the first element
the third element will be the third element plus the first and second elements
etc

for each element, add its value plus the values of the elements at previous
indices


def running_total(array)
  transformed_array = []
  array.each_with_index do |num, ind|
    transformed_array << array.first(ind + 1).sum
  end
  transformed_array
end


def running_total(array)
  counter = 0
  array.map do |_|
    counter += 1
    array.first(counter).sum
  end
end

=end

def running_total(array)
  sum = 0
  array.each_with_object([]) do |int, arr|
    arr << sum += int
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []