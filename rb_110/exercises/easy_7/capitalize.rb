=begin
write a method that takes a single string and returns a new string that contains
the original value of the argument with the first character of every word
capitalized and all other letters lowercase

you may assume that words are any sequence of non-blank characters


*doesn't say we can't use the capitalize method!*

take a string, turn to an array?
map the array by captializing each word
rejoin the words array


def word_cap(sentence)
  capitalized = sentence.split.map do |word| 
    ('a'..'z').include?(word[0]) ? word.capitalize : word
  end
  capitalized.join(' ')
end

=end


ALPHABET = ('a'..'z').zip('A'..'Z').to_h

def word_cap(sentence)
  
  capitalized = sentence.split.map do |word|
    word.each_char.with_index do |char, idx|
      if ('A'..'Z').include?(char)
        word[idx] = ALPHABET.key(char)
      end
    end
    
    if ('a'..'z').include?(word[0])
      word[0] = ALPHABET[word[0]]
    end
    word
  end
  capitalized.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'