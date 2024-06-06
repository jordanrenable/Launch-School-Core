=begin
write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes

words consist of any string of characters that do not include a space, so
punctuation will be included with a word


problem
take a string with words of varying lengths and with punctuation, return a hash
where the keys are the word lengths and the values are the number of words in
the string whose length is the key

examples
see below 3=> 1 5=> 1

data structures
input- string
output-hash
intermediate- create the hash before iterating

rules-
an empty string should return an empty hash

algorithm
take a string
break it into an array of words
for each word, count its length and then add the length as a key to the hash and
increase the value by one
  first check the hash to see if the key exists- if it does, increment the value
  by one
  if it does not, initialize the key with a value of 1


PART 1
first attempt
def word_sizes(string)
  string.split.each_with_object({}) do |word, hash|
    hash.include?(word.size) ? hash[word.size] += 1 : hash[word.size] = 1
  end
end

second pass
def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) { |word, hash| hash[word.size] += 1 }
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
=end

=begin
PART 2
eliminate non alphabet characters from the counts


def word_sizes(string)
  words = string.split.map { |word| word.delete('^A-Za-z') }
  words.each_with_object(Hash.new(0)) { |word, hash| hash[word.size] += 1 }
end
=end

def word_sizes(string)
  string.split.each_with_object(Hash.new(0)) do |word, hash| 
    hash[word.delete('^A-Za-z').size] += 1 
  end
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}