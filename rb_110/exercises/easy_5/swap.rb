=begin
def swap(string)
  words = string.split.each do |word|
            first = word[0]
            word[0] = word[-1]
            word[-1] = first
          end
  words.join(' ')
end
=end 

def swap(string)
  string.split.each { |word| word[0], word[-1] = word[-1], word[0] }.join(' ')
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
p swap("sunshine in my eyes") == "eunshins ni ym syee"

=begin
Problem
take a string and for each word, swap the first and last letters of those words

Examples


Data Structures
input- string
output- swapped string
intermediate- array of individual words
variables to store swapped letters temporarily

Algorithm
take a string
break the string into an array of individual words
for each word, swap the first letter with the last letter

reassemble the words into a sentence and return the sentence

=end
