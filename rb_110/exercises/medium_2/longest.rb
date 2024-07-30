=begin
write a program tha reads the content of a text file and then prints the longest
sentence in the file based on number of words. sentences may end with (. ! ?)
Any sequence of characters that are not spaces or sentence ending character
should be treated as words. You should also print the number of words in the
longest sentence.

iterate over each character?
check the character for . ! ? if not one of these, push to new string
if it is one of these, push to new string and push that string to an array
then clear the string

could get the word length at the same time as completed and push as a nested 
array or hash


count = 0
count += 1
    if sentences.key?(count)
      sentences[count] += [sentence]
    else
      sentences[count] = [sentence]
    end
      count = 0
  elsif char == ' '
    count += 1
    
    
  can also do content = File.read('text'.txt) and will not have to convert to
  string
  
  text.each_char do |char|
  sentence << char
  if ('.?!').include?(char)
    sentences << sentence
    sentence = ''
  end
end
=end

text = File.read 'text.txt'

sentences = []
sentence = []

words = text.split #<= an array of individual words

word_sizes = words.map { |word| [word.size, word] }

p word_sizes.max

words.each do |word|
  sentence << word
  if ('.!?').include? word[-1]
    sentences << sentence
    sentence = []
  end
end
    
sentences.map! do |sentence|
  [sentence.size, sentence.join(' ')]
end

p sentences.max
# sentences.sort.last