UPPERCASE = *('A'..'Z')
def process(word)
  return 0 if word.empty?

  count = 0
  word.chars.each do |c|
    count += 1 if UPPERCASE.include?(c)
  end
  return 0 if count < 2
  
  indices = []
  word.chars.each_with_index do |char, index|
    indices << index if UPPERCASE.include?(char)
  end
  
 indices[1] - indices[0] - 1
end

p process('') == 0
p process('Zooo') == 0
p process('foUrsCoreAnd') == 2


def decode(arr)
  return [] if arr.empty?
  codes = []
  arr.each do |word|
    codes << process(word)
  end

  codes
end