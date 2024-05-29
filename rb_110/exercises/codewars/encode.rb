=begin
We want to mutate a string according to a code. 
In this code, given the command '"9a"', we should change the character at index 
9 of the string to '"a"'.
Write a method that takes a string and a list of these commands, and mutates 
the string accordingly.

Problem
take a string and array of "commands"
commands are a combination of integer and letter, the number representing an
index and the letter representing what the existing letter should be changed
to

spaces count!

Examples

test_1 = "dog"
encode!(test_1, ["0f"])
p test_1 == "fog"

test_2 = "parrot"
encode!(test_2, ["0m", "3m", "8m"])
p test_2 == "marmot"

test_3 = "weimaraner"
encode!(test_3, ["0p", "2t", "3p", "6t"])
p test_3 == "petpartner"

test_4 = "incorrect long strung"
encode!(test_4, ["0a", "1 ", "18i"])
test_4 == "a correct long string"

Data Structure
input - string and array of strings
output- altered string

Algorithm
act directly on the commands
evaluate each command
separate the numbers from the characters
  break the command into an array of individual characters
  check each character- if it is a numeric string, push it to an index string
  if it is a letter, push it to a sub string
  alter the input string according to the index(converted to integer)
  and substring- reassign? gsub?
  
return the altered string

def encode!(str, arr)
  arr.each do |sub|
    str_arr = sub.chars
    char = str_arr.pop
    int = str_arr.join.to_i
    str[int] = char unless int >= str.length
  end
end
=end


def encode!(string, commands)
  commands.each do |command|
    index = ''
    sub = ''
    command.chars.each do |char|
      "0123456789".include?(char) ? (index << char) : (sub << char)
    end
    string[index.to_i] = sub if index.to_i < string.size
  end
end



test_1 = "dog"
encode!(test_1, ["0f"])
p test_1 == "fog"

test_2 = "parrot"
encode!(test_2, ["0m", "3m", "8m"])
p test_2 == "marmot"

test_3 = "weimaraner"
encode!(test_3, ["0p", "2t", "3p", "6t"])
p test_3 == "petpartner"

test_4 = "incorrect long strung"
encode!(test_4, ["0a", "1 ", "18i"])
p test_4 == "a correct long string"