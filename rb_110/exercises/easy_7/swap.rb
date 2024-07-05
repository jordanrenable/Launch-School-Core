=begin
write a method that takes a string as an arguement and returns a new string in
which every uppercase letter is replaced by its lowercase version and every
lowercase letter by its uppercase version
all other characters should be unchanged
you may not use swapcase

take a string
iterate over each character
if the character is lowercase, reassign it to an uppercase letter
if the character is uppercase, reassign it to a lowercase letter
can use upcase and downcase, or can use alphabet hash


# mutating
def swapcase(string)
  string.each_char.with_index do |char, index|
    if ('a'..'z').include?(char)
      string[index] = char.upcase
    elsif ('A'..'Z').include?(char)
      string[index] = char.downcase
    end
  end
end

# non-mutating
def swapcase(string)
  copy = string.dup
  copy.each_char.with_index do |char, index|
    if ('a'..'z').include?(char)
      copy[index] = char.upcase
    elsif ('A'..'Z').include?(char)
      copy[index] = char.downcase
    end
  end
end
=end

ALPHABET = ('a'..'z').zip('A'..'Z').to_h

def swapcase(string)
  swapped = string.chars.map do |char|
    if ('a'..'z').include?(char)
      char = ALPHABET[char]
    elsif ('A'..'Z').include?(char)
      char = ALPHABET.key(char)
    else
      char
    end
  end
  swapped.join
end

pascal = 'Pascal'

p swapcase(pascal)
p pascal

p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'