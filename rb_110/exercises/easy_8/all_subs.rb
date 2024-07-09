=begin
write a method that returns a list of all substrings of a string. the returned
list should be ordered by where in the string the substring begins
this means that all substrings that start at position 0 should come first, then
all the substrings that start at position 1, etc
since multiple substrings will occur at each position, the substrings at a given
position should be returned in order from shortest to longest

you may (and should) use the leading substrings method from the previous exercise



iterate over the string starting at the first index
call the leading strings method starting with the first index
=end


def leading_substrings(string)
  string.size.times.each_with_object([]) do |time, array|
    array << string[0..time]
  end
end

def substrings(string)
  substrings = []
  string.size.times do |time|
    substrings += leading_substrings(string[time..-1])
  end
  substrings
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]