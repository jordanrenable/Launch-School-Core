=begin
write a method named include? that takes an array and a search value as an
argument. return true if the search value is in the array, false if it is not

Data Structures
input- array and search value
output- true or false

Algorithm
iterate over each element in the array
if the element matches the search value, return true
if it gets all the way through and has not returned true, return false

=end

def include?(array, target)
  array.each do |element|
    return true if element == target
  end
  false
end



p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false