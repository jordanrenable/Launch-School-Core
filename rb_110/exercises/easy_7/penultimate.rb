=begin
write a method that returns the next to last word in the string passed as an
argument
words are any sequence of non-blank characters
assume the string will always contain at least two words


def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
p penultimate('')

=end

def middle(string)
  words = string.split
  if words.size.odd?
    words[words.size/2]
  elsif words.empty?
    ''
  else
    words[(words.size/2 - 1)..(words.size/2)].join(' ')
  end
end

p middle("This sentence has five words.")
p middle("This sentence is even.")
p middle("")