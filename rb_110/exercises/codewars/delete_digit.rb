=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1

Problem
input- Integer
output- integer which is the largest obtained of each option
if we delete one digit from the starting integer, what is the highest possible number

Examples


Data Structures
highest number variable
array of individual digits

Algorithm
given an integer, convert to string, convert to an array
for each digit, remove the digit, reassemble the digits into an Integer
  save the Integer if it is higher than previous integer
compare the next integer with saved integer and save whichever is higher

Array#delete_at
delete_digit(791983) == 91983

Code
=end

def delete_digit(int)
  highest = 0
  arr = int.to_s.chars # ['7', '9', '1', '9', '8', '3']

  arr.each_with_index do |digit, index|
    copy = arr.clone
    copy.delete_at(index)

    if copy.join.to_i > highest
      highest = copy.join.to_i
    end

  end
  highest
end

p delete_digit(791983) == 91983
p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1
