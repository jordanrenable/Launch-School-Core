=begin
Create a method that takes a string argument that consists entirely of numeric 
digits and computes the greatest product of four consecutive digits in the 
string. The argument will always have more than 4 digits.

PROBLEM
input- string of digits
output- integer, which is the highest product made using 4 consecutive digits 
from the string

EXAMPLES
'23456' => '2345' or '3456' - size is 5, 2 options
'3145926' => '3145' '1459' '4592' '5926' size is 7, 4 options


DATA STRUCTURES
input- string
intermediate- array of 4 digit substrings
may need to transform the array
output- integer

ALGORITHM
take a string of digits
find all the 4 length substrings
  figure out what our max index is

find the product for each substring and return the highest one
  convert each substring to individual characters, then integers
  find the product of each set of integers
  return the highest product

array of substrings ['2345', '3456'] passed to outer map call
  call chars on each substring ['2' '3' '4' '5']
  
digits array map 
  each subarray

=end

def greatest_product(string)
  substrings = find_4_digit_substrings(string)
  digits_arr = substrings.map do |substring|
    substring.chars.map do |char|
      char.to_i
    end.inject(:*)
  end
  digits_arr.max
end

def find_4_digit_substrings(string)
  substrings = []
  max_index = string.length - 4
  0.upto(max_index) do |start|
    substrings << string[start, 4]
  end
  substrings
end

p greatest_product('23456') == 360      # 3 * 4 * 5 * 6
p greatest_product('3145926') == 540    # 5 * 9 * 2 * 6
p greatest_product('1828172') == 128    # 1 * 8 * 2 * 8
p greatest_product('123987654') == 3024 # 9 * 8 * 7 * 6