=begin
write a method that takes a string and returns a new string in which every char
is doubled



def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

=end
=begin
write a method that takes a string and returns a new string in which every
consonant is doubled. vowels, digits, puncuation, and whitespace should not be
doubled.

*******
if char =~ /[a-z]/i && char =~ /[^aeiou]/i

if letter =~ /[a-zA-Z&&[^aeiou]]/
*******
=end

CONSONANTS = "bcdfghjklmnpqrstvwxyz"

def double_consonants(string)
  string.chars.map do |char| 
    CONSONANTS.include?(char.downcase) ? char * 2 : char
  end.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""