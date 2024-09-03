=begin
Create a method that takes an array of integers as an argument and returns the 
integer that appears an odd number of times. There will always be exactly one 
such integer in the input array.

PROBLEM
input- array of integers
output- integer, which is the one element that occurs an odd number of times

EXAMPLES

DATA STRUCTURES
input- array
intermediate- 
output- integer

ALGORITHM
take an array
iterate over the array
for each element, return the element if it occurs an odd number of times

=end

def odd_fellow(array)
  array.each do |int|
    return int if array.count(int).odd?
  end
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0