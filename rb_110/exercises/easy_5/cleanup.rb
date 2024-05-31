def cleanup(string)
  words = string.split.map do |word|
            word.gsub(/[^a-z]/, ' ')
          end
  words.join(' ').squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '