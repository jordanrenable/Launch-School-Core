=begin
Create a method that takes a nonempty string as an argument and returns an array 
consisting of a string and an integer. If we call the string argument s, the 
string component of the returned array t, and the integer component of the 
returned array k, then s, t, and k must be related to each other such that 
s == t * k. The values of t and k should be the shortest possible substring and 
the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase 
alphabetic letters.

PROBLEM
input- string
output- 2 element array, first element is a substring, and the second element is 
an integer
  - the relationship of these elements are that element 1 * element 2 equals 
  input string

string length / integer = substring length
string length / substring length = integer

EXAMPLES

DATA STRUCTURES
input- string
intermediate- array of substrings? 
output- array

ALGORITHM
take a string
initialize an empty substring array
find all the unique substrings

initialize array of possible answers- 
iterate over the array of substrings
check if the substring * (string length / substring length) == string
add the substring to the possible answers

with the possible answers, save the shortest one as the result
to find the integer, divide the string size by the result size

return the result and the integer in an array

=end

def repeated_substring(string)
  unique_substrings = find_unique_substrings(string)
  compatible_substrings = []
  unique_substrings.each do |substring|
    multiplier = string.size / substring.size
    compatible_substrings << substring if substring * multiplier == string
  end
  result = compatible_substrings.min_by { |substring| substring.size }
  [result, (string.size / result.size) ]
end

def find_unique_substrings(string)
  substrings = []
  max_index = string.size - 1
  0.upto(max_index) do |start|
    start.upto(max_index) do |last|
      substrings << string[start..last]
    end
  end
  substrings.uniq
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]