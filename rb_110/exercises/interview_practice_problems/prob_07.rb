=begin
Create a method that takes an array of integers as an argument and returns the 
number of identical pairs of integers in that array. For instance, the number of 
identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 
2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For 
instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The 
first array contains two complete pairs while the second has an extra 2 that 
isn't part of the other two pairs.

PROBLEM
input- array of integers
output- integer, representing the number of whole pairs within the array
only counts as a pair if there are at least 2, and for every 2 it counts as an additional pair
return 0 if array contains 1 or fewer elements

EXAMPLES

DATA STRUCURES
input- array
intermediate- pairs counter, int count hash
output- integer

ALGORITHM
take an array of integers
initialize pairs counter to 0
initialize initialize empty hash
iterate over the integers
if the integer is a key in the hash, increment the value by 1
  if not, add the int to the hash as a key with a value of 1

{ 3=>2, 1=>1, 4=>1, 5=>3, 9=>2, 2=>1, 6=>1, 8=>1, 7=>1}
value 2- pair += 1 (value / 2)
value 3- pair += 1
value 4- pair += 2

iterate over the hash
if the value is 2 or greater
increment pair counter by the value / 2

return pair counter

=end

def pairs(array)
  pairs = 0
  int_count = create_hash(array)
  int_count.each do |_, frequency|
    pairs += (frequency / 2) if frequency >= 2
  end
  pairs
end

def create_hash(array)
  array.each_with_object({}) do |el, hash|
    hash.key?(el) ? hash[el] += 1 : hash[el] = 1
  end
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3