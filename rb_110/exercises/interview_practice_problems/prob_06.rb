=begin
Create a method that takes a string argument and returns a hash in which the 
keys represent the lowercase letters in the string, and the values represent 
how often the corresponding letter occurs in the string.

PROBLEM
input- string
output- hash, representing the lower case letters only and their frequencies

uppercase, whitespace, and puncuation don't count

EXAMPLES

DATA STRUCTURES
input- string
array of lower case characters-- don't need an array, can use a range
output-hash

ALGORITHM
take a string
initialize an empty hash
can either eliminate all non lower case characters, or can check
each character each time to see if it is lower case
if the lower case character array includes the character,
  if the hash already contains the char as a key, increment the value by 1
  if it does not contain the char as a key, add the char to the hash with a value of 1
return the hash

=end
def count_letters(string)
  char_count = {}
  string.delete('^a-z').each_char do |char|
    char_count.key?(char) ? char_count[char] += 1 : char_count[char] = 1
  end
  char_count
end


def count_letters(string)
  char_count = {}
  string.each_char do |char|
    next unless ("a".."z").include?(char)
    if char_count.key?(char)
      char_count[char] += 1
    else
      char_count[char] = 1
    end
  end
  char_count
end

expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}