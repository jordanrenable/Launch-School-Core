=begin
Create a method that takes a string of digits as an argument and returns the number of even-numbered substrings that can be formed. For example, in the case of '1432', the even-numbered substrings are '14', '1432', '4', '432', '32', and '2', for a total of 6 substrings.

If a substring occurs more than once, you should count each occurrence as a separate substring.

PROBLEM
input- string of digits
output- integer, representing the number of even substrings made from the input
repeat occurrences count separately

EXAMPLES

DATA STRUCTURES
input- string
intermediate- array of substrings
output- integer

ALGORITHM
take a string of digits
initialize an empty array for all substrings
find all of the substrings from the input and store in array
  - iterate over the string from index 0 to max index
  for each character, starting with that character
  - iterate over the remainder of the string from starting index to max index
  - store the substring in the substring array

    1432- length of string= 4, index 0-3, max index= string size -1
    1st- 1, 14, 143, 1432 
    2nd- 4, 43, 432        
    3rd- 3, 32           
    4th- 2

transform the array of substrings to their integer counterparts
  - iterate over each substring, convert to an integer, and store in new array
iterate over the array of integers and count and return how many of the elements are even
  - could be done by checking if the int is even and incrementing a counter, or by using count


def even_substrings(string)
  substrings = find_substrings(string)
  int_arr = substrings.map { |el| el.to_i }
  int_arr.count { |int| int.even? }
end

def even_substrings(string)
  substrings = find_substrings(string)
  even_substring_count = 0
  substrings.each do |substring|
    even_substring_count += 1 if substring.to_i.even?
  end
  even_substring_count
end
=end

def even_substrings(string)
  substrings = find_substrings(string)
  substrings.count { |substring| substring.to_i.even? }
end

def find_substrings(string)
  substrings = []
  max_index = string.size - 1
  0.upto(max_index) do |start|
    start.upto(max_index) do |last|
      substrings << string[start..last]
    end
  end
  substrings
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12