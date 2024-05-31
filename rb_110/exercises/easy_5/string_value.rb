=begin
Write a method that determines and returns the ASCII string value of a string 
that is passed in as an argument. The ASCII string value is the sum of the ASCII 
values of every character in the string. (You may use String#ord to determine 
the ASCII value of a character.)

Problem
given a string, determine the sum of all ASCII values for each character
spaces == 0!

Examples
see below

Data Structures
input- string
output- integer
intermediate- array of each character?
sum variable

Algorithm
take a string
create array of characters as they are
initialize sum variable to zero
for each character in array, determine its ascii value
  add that value to sum
return sum


string.each_char also works
=end

def ascii_value(string)
  chars = string.chars
  sum = 0

  chars.each do |char|
    sum += char.ord
  end
  sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0