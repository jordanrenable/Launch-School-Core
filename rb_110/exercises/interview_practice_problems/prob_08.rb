=begin
Create a method that takes a non-empty string as an argument. The string 
consists entirely of lowercase alphabetic characters. The method should return 
the length of the longest vowel substring. The vowels of interest are "a", "e", 
"i", "o", and "u".

PROBLEM
input- string
output- integer which represents the length of the longest vowel substring
don't need to worry about case

EXAMPLES

DATA STRUCTURES
input- string
intermediate- array of substrings
output- integer

ALGORITHM
take a string

  -iterate over each character 
  - if the char is a vowel, increment a vowel counter
  - if the next char is a vowel, increment the counter
  - if the next char is not a vowel, save the vowel counter to a longest vowel 
  count variable if the vowel counter is higher than the current longest vowel count
  - reset the vowel counter

return longest_vowel_substring

=end

def longest_vowel_substring(string)
  longest_vowel_substring = 0
  vowel_count = 0

  string.each_char do |char|
    'aeiou'.include?(char) ? vowel_count += 1 : vowel_count = 0

    longest_vowel_substring = vowel_count if vowel_count > longest_vowel_substring
  end

  longest_vowel_substring
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5
