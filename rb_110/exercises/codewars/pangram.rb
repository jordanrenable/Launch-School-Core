def pangram?(string)

  alphabet = {}
  ('a'..'z').each do |letter|
    alphabet[letter] = false
  end

  string.each_char do |char|
    alphabet[char] = true
  end

  alphabet.values.all?(true)

end

p pangram?("The quick brown fox jumps over the lazy dog.") == true
p pangram?("This is not a pangram.") == false