sentence = ["Studying", "with", "friends", "makes", "it", "all", "possible"]

def capitalize_seconds(array)
  array.map do |word|
    (word.chars.each_with_index do |letter, index|
      letter.capitalize! if index % 2 != 0
    end).join
  end
end

p sentence
p capitalize_seconds(sentence)
