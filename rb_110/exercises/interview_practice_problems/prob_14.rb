=begin
Create a method that takes a single integer argument and returns the sum of all 
the multiples of 7 or 11 that are less than the argument. If a number is a 
multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 
22. The sum of these multiples is 75.

If the argument is negative, return 0.

PROBLEM
input- integer
output- integer, the sum of the multiples of 7 and 11 that are below the input
take an integer
find all the multiples of 7 and 11 that are less than the input integer (not 
including 1)
return the sum of these integers

EXAMPLES
input 10
multiples 7

input 11
multiples 7

input 12
multiples 7 11

DATA STRUCTURES
input- integer
intermediate- array
output- integer

ALGORITHM
take an integer
find all the multiple of 7 and 11 that are less than the input integer
  for each starting number, we could check to see if it's less than the input 
  push it to the array, increment it by itself, start again
    break if multiple is greater than or equal to input integer

    for every number from 2..input integer
      check if evenly divisible by 7 or 11, if so add to array

  push these to an array
eliminate duplicates from array
return the sum of the integers in the array
  intitalize a counter, increment the counter by each of the elements in the 
  array
  sum method
  reduce/inject

=end

def seven_eleven(int)
  return 0 if int < 0
  multiples = find_multiples_of_7_and_11(int)
  multiples.sum
end

def find_multiples_of_7_and_11(int)
  multiples = []
  2.upto(int - 1) do |num|
    multiples << num if num % 7 == 0 || num % 11 == 0
  end
  multiples
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0