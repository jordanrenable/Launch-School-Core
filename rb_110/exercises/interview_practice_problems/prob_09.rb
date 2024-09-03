=begin

Create a method that takes two string arguments and returns the number of times that the second string occurs in the first string. Note that overlapping strings don't count: 'babab' contains 1 instance of 'bab', not 2.

You may assume that the second argument is never an empty string.

PROBLEM
input- strings, 2
output- integer, representing the number of times string 2 is present in string 1
rules- overlapping letters don't count for an additional string

do we need to consider case? (not with these test cases?)

EXAMPLES

DATA STRUCTURES
input- strings
intermediate- 
output- integer

ALGORITHM
take a string
count each instance of string 2 within string 1, without counting overlapping instances

=end

def count_substrings(str1, str2)
  str1.gsub(str2, '*').count('*')
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1