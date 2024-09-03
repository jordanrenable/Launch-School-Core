=begin
Create a method that takes a string argument and returns a copy of the string 
with every second character in every third word converted to uppercase. Other 
characters should remain the same.

PROBLEM
input- string
output- copy of string
  - every 2nd letter in every 3rd word is uppercase

EXAMPLES

DATA STRUCTURES
input- string
intermediate- convert strings to arrays
array of words 
  array of chars within every 3rd word
output- string

ALGORITHM
given a string
split the string into an array of individual words and store in variable
iterate over each word
  check the index to see if it is the third word
  for each third word, change every 2nd letter to uppercase
    -to find every third word, (index + 1) % 3 == 0
    iterate over the letters in the third word
    for every second letter
      - index is odd? make uppercase
=end

def to_weird_case(string)
  results = string.split.map.with_index do |word, word_idx|
    if (word_idx + 1) % 3 == 0
      word = word.chars.map.with_index do |char, char_idx| 
        char_idx.odd? ? char.upcase : char
        end
      word.join
    else
      word
    end
  end
  results.join(" ")
end

original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected