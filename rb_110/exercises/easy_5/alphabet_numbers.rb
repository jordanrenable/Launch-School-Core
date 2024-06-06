=begin
Write a method that takes an Array of Integers between 0 and 19, and returns an 
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, 
thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Problem
take an array containing the integers 0-19 and return an array where those
numbers have been sorted in order of their English word form equivalent
put the numbers in alphabetical order

Example
see below

Data Structures
input- array of integers 0-19
output- array of integers in alphabetical order
intermediate-

Algorithm
use a hash where the integer is the key and the word is the value

take an array of integers 0-19
convert those numbers with their word equivalent by using hash reference
reorder them based on their alphabetical order
convert them back to their integer form by hash reference

=end

ALPHABETIC_NUMBERS = { 
                      0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 
                      4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven', 
                      8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven',
                      12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen', 
                      15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen',
                      18 => 'eighteen', 19 => 'nineteen'
                      }

def alphabetic_number_sort(array)
  words = array.each_with_object([]) do |integer, words|
            words << ALPHABETIC_NUMBERS[integer]
          end
  words.sort.map do |word|
    ALPHABETIC_NUMBERS.key(word)
  end
end



p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]