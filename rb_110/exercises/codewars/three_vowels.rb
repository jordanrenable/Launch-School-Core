=begin
Given a word, return a copy of that word, removing every vowel after the first three:

PROBLEM
input- string
output- string
  - which represents the word with all vowels removed after the first three vowels
Rules
  - AEIOUY all count as vowels?
  - vowels may be upper or lower case so must check both
  - don't change the case of existing letters

EXAMPLES

DATA STRUCTURES
input- string
intermediate- an array of the vowels? constant?
can either do lower and upper or just one or the other, which is easier overall?
  create an empty string to push the characters to
output- string

ALGORITHM
take a string
initalize a counter
iterate over each character
if the counter is less than 3
  if the character is a vowel, increment the counter
    and push the character to the new string
    if it is not a vowel, push it to the new string
when the counter hits 3
  if the character is a vowel, skip it
  if it's not, push it to the string
return the new string
=end

VOWELS = %w(a e i o u y A E I O U Y)

def three_vowels(string)
  results = ''
  vowel_count = 0
  string.each_char do |char|
    if VOWELS.include?(char)
      results << char if vowel_count < 3
      vowel_count += 1
    else
      results << char
    end
  end
  results
end