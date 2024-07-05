=begin
Consider the word "abode". We can see that the letter a is in position 1 and b 
is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice 
also that d and e in abode occupy the positions they would occupy in the 
alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy 
their positions in the alphabet for each word. For example,
=end

def symm(word_array)
  alphabet = ('a'..'z').to_a
  matches = []
  word_array.each do |word|
    counter = 0
    word.each_char.with_index do |char, index|
      if index == alphabet.index(char.downcase)
        counter += 1
      end
    end
    matches << counter
  end
  matches
end


p symm(["abode","ABc","xyzD"]) == [4, 3, 1]
p symm(["abide","ABc","xyz"]) == [4, 3, 0]
p symm(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6, 5, 7]
p symm(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]