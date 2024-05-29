=begin
We're receiving a set of messages in code. The messages are sets of text
strings, like:
"alakwnwenvocxzZjsf"
Write a method to decode these strings into numbers. The decoded number should
be the number of lowercase characters between the first two uppercase
characters. If there aren't two uppercase characters, the number should be 0.

Test cases:
p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []

Problem
given an array of strings, evaluate each string and return an integer
representing the number of lowercase characters between the first two uppercase
characters

Examples
see above
codes = ["WooT", "exTRa", "pAlindRome"]
decode(codes) == [2, 0, 4]

Data Structures
input- array of strings
output- array of integers
intermediate- array to save uppercase indices?
array for integers

Algorithm
take an array of strings
iterate over each word
for each word, iterate over each character
  check if letter is uppercase?
  if uppercase, save index to array?

  if the index array is <2, push 0 into integer array
    otherwise, take the first two elements
    count the number of characters between string index element 1 and string
    index element 2
    push the returned integer into an integer array

edge case- word is only two letters, slice +- wont work

=end

def decode(array)
  integers = []
  array.each do |word|
    uppercase_indices = []
    word.each_char.with_index do |letter, index|
      if ("A".."Z").include?(letter)
        uppercase_indices << index
      end
    end
    if word.size <= 2 || uppercase_indices.size < 2
      integers << 0
    else
      integers << word[uppercase_indices[0]...uppercase_indices[1]].size - 1
    end
  end
  integers
end

codes = ["WooT", "exTRa", "pAlindRome"]
p decode(codes)

p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []
