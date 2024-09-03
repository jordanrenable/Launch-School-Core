=begin
Create a method that takes a string as an argument and returns true if the 
string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. 
For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram 
since it uses every letter at least once. Note that case is irrelevant.

PROBLEM
input- string
output- boolean
rules- not case sensitive
does a string contain at least 1 of each letter in the alphabet

EXAMPLES


DATA STRUCTURES
input- string
intermediate- alphabet hash?
output- boolean

ALGORITHM
option 1- create alphabet hash, increment the letter key value by 1 for each 
character in the string (ignoring special characters), check the hash that all 
values are 1 or greater, return true if so
option 2- downcase the string
  remove all characters not a-z
  convert to array
  remove all duplicate characters
  check if string/array size is 26, true if so

=end

def is_pangram(string)
  chars = string.downcase.delete("^a-z").chars.uniq
  chars.size == 26
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true
p my_str