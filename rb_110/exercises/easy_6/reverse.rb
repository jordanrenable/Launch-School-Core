=begin
Write a method that takes an Array as an argument, and reverses its elements in 
place; that is, mutate the Array passed into this method. The return value 
should be the same Array object.


how can we mutate the array from inside the method? 
element assignment?

Algorithm
take an array of elements
create a duplicate version of the array 

Opt 1
using the duplicate as a guide, reassign the elements of the original array in
reverse order 

Opt 2
delete the elements in the original array
push new elements to the array starting at the end of the duplicate (pop?)


return the mutated array

def reverse!(array)
  copy = array.dup
  array.clear
  array << copy.pop until copy.empty?
  array
end

list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

def reverse(array)
  copy = array.dup
  new = []
  new << copy.pop until copy.empty?
  new
end

def reverse(array)
  new = []
  array.each { |el| new.prepend(el) }
  new
=end

def reverse(array)
  array.each_with_object([]) { |el, new_arr| new_arr.prepend(el) }
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true