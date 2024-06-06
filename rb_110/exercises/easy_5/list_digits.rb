=begin
Write a method that takes one argument, a positive integer, and returns a list 
of the digits in the number.

Problem
take an integer and return an array with each of the digits individually

Data Structures
input- integer
output- array of integers
intermediate-

Algorithm
take an integer
take the modulo of the number and push it to a new array
reassign the number to the quotient without the modulo
continue to take the modulo until it is less than zero?
prepend each modulo to the new array

=end

def digit_list(integer)
  list = []
  until integer < 1
    list.prepend(integer % 10)
    integer /= 10
  end
  list
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true