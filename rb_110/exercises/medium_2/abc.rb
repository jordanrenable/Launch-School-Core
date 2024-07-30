=begin
write a method that returns true if the word passed in can be spelled using this
set of blocks, false otherwise.

The blocks have two letters per block. If the word contains one of these letters,
it cannot contain the other.

Letters can only be used once within a word.

Method is case insensitive.


given a word
upcase the word
iterate over each letter in the word
for each letter, check that the remaining letters are not the same letter or the
excluded letter (iterate over the remaining letters?)
if the remaining letters are one of the excluded letters, return false
if not, move to the next letter
return true


=end

BLOCKS = { 'A' => ['A', 'N'], 'B' => ['B', 'O'], 'C' => ['C', 'P'], 
           'D' => ['D', 'Q'], 'E' => ['E', 'R'], 'F' => ['F', 'S'], 
           'G' => ['G', 'T'], 'H' => ['H', 'U'], 'I' => ['I', 'V'], 
           'J' => ['J', 'W'], 'K' => ['K', 'X'], 'L' => ['L', 'Y'], 
           'M' => ['M', 'Z'], 'N' => ['A', 'N'], 'O' => ['B', 'O'],
           'P' => ['C', 'P'], 'Q' => ['D', 'Q'], 'R' => ['E', 'R'],
           'S' => ['F', 'S'], 'T' => ['G', 'T'], 'U' => ['H', 'U'],
           'V' => ['I', 'V'], 'W' => ['J', 'W'], 'X' => ['K', 'X'],
           'Y' => ['L', 'Y'], 'Z' => ['M', 'Z'] }
           
def block_word?(string)
  word = string.upcase.chars
  word.each_with_index do |letter, index|
    word[(index + 1)..-1].each do |char|
      if BLOCKS[letter].include?(char)
        return false
      end
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('apples') == false
p block_word?('Baby') == false