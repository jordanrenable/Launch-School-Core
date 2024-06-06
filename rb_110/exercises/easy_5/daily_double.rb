=begin
write a method that takes a string argument and returns a new string that
contains the value of the original string with all consecutive duplicate 
characters collapsed into a single character

cannot use string.squeeze or squeeze!

Problem
eliminate consecutive duplicate letters/numbers from strings

Data Structures
input- string
output- collapsed string
intermediate- array to hold characters

Algorithm
take a string
for each character in the string, push it to an array if the last character in
the array is not the current character
rejoin the characters



def crunch(string)
  clean_string = ''
  string.each_char { |char| clean_string << char if char != clean_string[-1] }
  clean_string
end
=end
def crunch(input_string)
  input_string.chars.each_with_object('') do |char, clean_string| 
    clean_string << char if char != clean_string[-1]
  end
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''