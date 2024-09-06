=begin
Create a method that returns the count of distinct case-insensitive alphabetic 
characters and numeric digits that occur more than once in the input string. You 
may assume that the input string contains only alphanumeric characters.

PROBLEM
input- string
output- integer, # of characters that occur more than once in the string
case insensitive

EXAMPLES

DATA STRUCTURES
input- string
intermediate- array of repeated characters
output- integer

ALGORITHM
take a string
downcase the string
initialize an array for multiples
for each character in the string
  if count of that char is > 1, add to array

eliminate duplicates from array
return size of array

=end

def distinct_multiples(string)
  string = string.downcase
  multiples = []
  string.each_char do |char| 
    multiples << char if string.count(char) > 1
  end
  multiples.uniq.size
end

p distinct_multiples('xyz') == 0               # (none
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5