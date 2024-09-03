=begin
Given a string and an integer i, write a method that splits the string up into a sentence of strings, where each string in the sentence contains a character of the argued string and every ith character after it:

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""


PROBLEM
take a string (could be a word, sentence, series of letters)
and an integer

Rules- 
spaces do not count- reject them

output sentence will be the same number of "words" as there are alphabetic characters

each word will consist first of the letter represented by that iteration plus letters at the ith place (integer 3, every third letter following)

empty strings return empty strings

cannot take an integer < 1- return an "error"

Examples
see above, 3
sav ebe eo av be o v e

Data Structures
input- string and integer
output- string of 'words'
in between- an array to hold each character
variable to hold sentence
second variable to hold word components?

Algorithm
Take a string (downcase?)
delete all spaces
put all letters into an array

for each letter in the array (size of array number of times?)
  on first iteration, push the letter represented by that iteration into a word bank
  if the iteration % integer == 0 push that letter into the word bank
  once you get to the end, push a space followed by the word into the sentence bank

  return the sentence

[a, b, c, d, e]

=end

  def fragment(str, int)
    return "i cannot be less than 1" if int < 1
    chars = str.downcase.delete(' ')
    sentence = []
    chars.size.times do |time|
      counter = time
      word = ''
      loop do
        word << chars[counter]
        counter += int
        break if counter >= chars.size
      end
      sentence << word
    end
    sentence.join(' ')
  end


p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""




# Given a string and an integer i, write a method that splits the string up into a sentence of strings, where each string in the sentence contains a character of the argued string and every ith character after it:

# PROBLEM
# take a string- each letter in the original string will become the first letter of a new "word" in the new string
# the remainder of the letters in each new "word" will be made from every ith character 

# EXAMPLES
# "abcde" 
# "a" "b" "c" "d" "e"
# "abcde" "bcde" "cde" "de" "e"

# DATE STRUCTURES
# input- string
# intermediate- an array of all of the characters
# an array of each of the words, transformed to just the first letter of each maybe? need to have the starting letter of each new word
# may need to use indices to have a starting point
# a results string
# output- string
#

# ALGORITHM
# take a string and an integer
# create an array of the individual characters
# create a new empty string
# iterate over the array of characters with the index
# on the first character, add the character to the new string
# iterate over the remainder of the characters after the starting character
# if the index of the character is evenly divisible by the input integer, add that character to the new string
# return the new string

def fragment(string, int)
  return "i cannot be less than 1" if int < 1
  results = ''
  chars = string.delete(' ').chars
  max_index = chars.size - 1
  chars.each_with_index do |char, index|
    (index).step(max_index, int) do |idx|
        results << chars[idx]
    end
    results << ' '
  end
  results[0..-2]
end
  

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""