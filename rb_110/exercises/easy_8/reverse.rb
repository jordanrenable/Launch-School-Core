=begin
write a method that takes one string argument and returns a new string with the
words in reverse order


def reverse_sentence(string)
  string.split.reverse.join(' ')
end

def reverse_sentence(string)
  words = string.split
  reversed = []
  words.each { |word| reversed.prepend(word) }
  reversed.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

=end
=begin
write a method that takes one string argument and returns the given string
with words that contain 5 or more characters reversed
each string will consist of only letters and spaces. spaces should be included
only when more than one word is present

def reverse_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

=end

def reverse_words(string)
  words = string.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end
  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS