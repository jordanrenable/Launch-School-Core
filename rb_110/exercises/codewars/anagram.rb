def anagram_difference(str1, str2)
  letters_to_remove = 0
  
  ('a'..'z').each do |char|
    letters_to_remove += (str1.count(char) - str2.count(char)).abs
  end

  letters_to_remove
end

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0 
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2 
p anagram_difference('a', 'aab') == 2 
p anagram_difference('codewars', 'hackerrank') == 10 
p anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
p anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50

=begin
Given two words, how many letters do you have to remove from them to make them anagrams?

anagram_difference('', '') == 0
anagram_difference('a', '') == 1
anagram_difference('', 'a') == 1
anagram_difference('ab', 'a') == 1
anagram_difference('ab', 'ba') == 0 
anagram_difference('ab', 'cd') == 4
anagram_difference('aab', 'a') == 2 
anagram_difference('a', 'aab') == 2 
anagram_difference('codewars', 'hackerrank') == 10 
anagram_difference("oudvfdjvpnzuoratzfawyjvgtuymwzccpppeluaekdlvfkhclwau", "trvhyfkdbdqbxmwpbvffiodwkhwjdjlynauunhxxafscwttqkkqw") == 42
anagram_difference("fcvgqognzlzxhmtjoahpajlplfqtatuhckxpskhxiruzjirvpimrrqluhhfkkjnjeuvxzmxo", "qcfhjjhkghnmanwcthnhqsuigwzashweevbegwsbetjuyfoarckmofrfcepkcafznykmrynt") == 50

Problem
input- two strings
output- an integer which represents the number of letters which either do not exist in both
strings, or exist in different quantity

ultimately the question is how many of the letters are the same in each string?

count each character for each word and compare
add the difference to a counter

Examples
see above

Data structures
array of characters to iterate through
each string as an array of characters
counter variable


Algorithm
take two strings
initialize a counter to 0
if both strings are empty, return 0
for each alphabetic character, count the number of that character in each string
compare the count of each character in string 1 to string 2
if the count is equal, go to the next character
if string 1 is higher, subtract the count of string 2 from string 1
if string 2 is higher, subtract the count of string 1 from string 2
(or just subtract and take the absolute value)
increment the difference to counter

Coding
=end
