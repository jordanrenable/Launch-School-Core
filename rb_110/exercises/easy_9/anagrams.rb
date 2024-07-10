=begin
given the array
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

write a program that prints out groups of words that are anagrams. anagrams are words that contain the same letters but in a different order.

iterate over each word
for each word, create a sorted array of its characters
  then iterate over the remaining words
  if the words sorted characters equal the original words sorted chars, append the word to an array with the original word
    delete the word from the array


result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end


words.group_by {|word| word.chars.sort}.each_value {|v| p v}

def anagrams(words)
  anagrams = words.group_by { |word| word.chars.sort }
  anagrams.each_value { |value| p value }
end


=end

def anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end

def print_anagrams(array)
  groups = []
  copy = array.dup
  copy.each_with_index do |word1, index|
    anagrams = [word1]
    copy[index+1..-1].each do |word2|
      if anagram?(word1, word2)
        anagrams << word2
        copy.delete(word2)
      end
    end
    groups << anagrams
  end
  groups.each { |group| p group }
end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

print_anagrams(words)