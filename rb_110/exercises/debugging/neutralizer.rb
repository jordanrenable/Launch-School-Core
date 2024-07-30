=begin
def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words_to_delete = []
  for word in words
    words_to_delete << word if negative?(word)
  end
  words_to_delete.each { |word| words.delete(word) }
  words.join(' ')
end