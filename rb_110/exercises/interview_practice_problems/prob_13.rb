=begin
Create a method that takes two strings as arguments and returns true if some 
portion of the characters in the first string can be rearranged to match the 
characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic 
characters. Neither string will be empty.

PROBLEM
input- 2 strings
output- boolean
can string2 be formed by the letters in string 1?
rules- string 1 must be of equal length or longer

EXAMPLES

DATA STRUCTURES
input- strings
intermediate- 
output- boolean

ALGORITHM
take 2 strings
iterate over each character in string 2
if string 1 contains the character, delete it from string 1 (use sub?)
else return false

return true
=end

def unscramble(str1, str2)
  str2.each_char do |char|
    if str1.include?(char)
      str1 = str1.sub(char, '')
    else
      return false
    end
  end
  true
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true