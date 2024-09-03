=begin
Create a method that takes a string argument and returns the character that 
occurs most often in the string. If there are multiple characters with the same 
greatest frequency, return the one that appears first in the string. When 
counting characters, consider uppercase and lowercase versions to be the same.

PROBLEM
input- string
output- string consisting of one character, the char that occurs most frequently 
in the string
take a string, count the number of each character, return the character that is 
highest and first in the string
not case sensitive

EXAMPLES
return value should be lower case

DATA STRUCTURES
input- string
intermediate- hash
output- string

ALGORITHM
take a string. reassign the string to a downcased version
initialize an empty hash for char count
iterate over each character in the string
for each character, check the hash to see if that char is a key
  if it is already in the hash, increment the value by 1
  if it is not in the hash, add the key to the hash with a value of 1

once the hash is built, check to see which character has the highest value, 
return the first character in the hash with the highest value

QUESTIONS i would ask the interviewer
Are white space and punctuation considered characters that could be returned, or
should we only count alphabetic (or alphanumeric?)


=end

def most_common_char(string)
  string = string.downcase
  char_count = {}
  string.each_char do |char|
    if char_count.key?(char)
      char_count[char] += 1
    else 
      char_count[char] = 1
    end
  end
  char_count.max_by {|k, v| v }.first
end


p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'