=begin
write a method that takes a sentence string as input and returns the string but
with any sequence of the words (number words) converted into a string of digits


iterate over each word 
if the word matches a number word, replace it with the string digit


def phone_number(words)
  phone_number = ''
  words.each do |word|
    if DIGITS_HASH.values.include?(word)
      phone_number << word
    else
      phone_number = ''
    end
  end
  if phone_number.size == 10

***HOW DOES THIS WORK?!***
# case insensitive, and removes spaces in between inserted numbers, and converts any 10 consecutive digits to phone number format
DIGITS = %w[zero one two three four five six seven eight nine]
def word_to_digit(str)
  str.gsub(/\w+ ?/) { |w| DIGITS.index(w.downcase.strip) || ' ' + w }
     .strip
     .squeeze(' ')
     .gsub(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
end

def word_to_digit(string)
  string.split.map do |word|
    temp = word.downcase.delete("^a-z")
    if STRING_DIGITS.include?(temp)
      word.downcase.gsub(temp, DIGITS_HASH[temp])
    else
      word
    end
  end.join(' ')
end

 # Phone number formatting
  result.gsub!(/\d{10}/) do |num|
    "(#{num[0..2]}) #{num[3..5]}-#{num[6..9]}"


=end

STRING_DIGITS = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
                  'eight', 'nine']
# STRING_DIGITS.index(temp).to_s
 DIGITS_HASH = { 'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 
                'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 
                'eight' => '8', 'nine' => '9' }




def word_to_digit(string)
  string.split.each do |word|
    temp = word.downcase.delete("^a-z")
    string.gsub!(word.delete("^A-z"), (DIGITS_HASH.include?(temp) ? DIGITS_HASH[temp] : word))
  end
  string
end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 
              'Please call me at 5 5 5 1 2 3 4. Thanks.'
              
p word_to_digit('The number Eight and SEVen.')