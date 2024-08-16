=begin
count how many times a substring exists in a string


PROBLEM
given 2 strings, count the number of times str2 occurs in str1
substrings can overlap! one for each index essentially

EXAMPLES
p substring_count('abaaba', 'b') == 2
p substring_count('abbabb', 'bb') == 2
p substring_count('cc', 'cc') == 1
p substring_count('', 'ab') == 0
p substring_count('abcd', 'gh' == 0
p substring_count('aaaaa', 'a') == 4

initialize an array for all substrings
obtain the list of substrings and store them in the substrings array

count how many times str 2 exists in the array of substring and return that #

DATA STRUCTURES
input- two strings
  don't think I will need to convert to array, but possibly
  
output- integer
  -which represents the number of times str2 occurs in str1

ALGORITHM
initialize an array for all substrings
obtain the list of substrings and store them in the substrings array

OUTER ITERATION- for each character (iterate the string.size number of times)

  INNER ITERATION- iterate over the remainder of the string, starting with the
  index of the character from the outer iteration up to the length of the string
  minus 1 (the final index)
  push the substring to an array on each iteration
  

count how many times str 2 exists in the array of substrings and return that #


string.each_char.with_index do |char, index|

def get_all_substrings(string)
  substrings = []
  min_length = 1
  last_index = string.size - min_length
  start_indexes = (0..last_index)

  start_indexes.each do |start_index|
    max_length = string.size - start_index
    lengths = (min_length..max_length)

    lengths.each do |length|
      substrings << string[start_index, length]
    end
  end

  substrings
end

=end


def substring_count(str1, str2)
  substrings = find_substrings(str1)
  substrings.select { |substring| substring == str2 }.size
end


def find_substrings(string)
  subs = []
  last_index = string.size - 1
  0.upto(last_index) do |index|
    index.upto(last_index) do |iteration|
      subs << string[index..iteration]
    end
  end
  subs
end

p substring_count('abaaba', 'b') == 2
p substring_count('abbabb', 'bb') == 2
p substring_count('cc', 'cc') == 1
p substring_count('', 'ab') == 0
p substring_count('abcd', 'gh') == 0
p substring_count('aaaaa', 'aa') == 4