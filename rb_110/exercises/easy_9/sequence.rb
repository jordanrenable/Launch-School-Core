=begin
write a method that takes two integers as arguments. the first is a count, the second is the first number of a sequence the method will create. the method should return an array containing the same number of elements as the count, while the values of each element will be multiples of the starting number

assume the count will always have a value of 0 or greater, while the starting number can be any integer.

take two integers, a count(array size) and a multiplier
initiate an empty array
from 1 to the count, append the multiplier * count to the array

def sequence(count, multiplier)
  (1..count).map { |time| time * multiplier }
end

=end

def sequence(count, multiplier)
  results = []
  1.upto(count) { |i| results << multiplier * i }
  results
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []