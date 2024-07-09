=begin
write a method that returns a list of all substrings that are palindromic, that
is each substring is the same forwards and backwards. the return value should be
arranged in the same sequence as the substrings appear in the string. duplicate
palindromes should be included multiple times

use the substrings method from the previous exercise

rules-
single letter substrings are not palindromes (but two idenitcal letters is)
CASE SENSITIVE
include non letter


first find all the leading substrings- method

then find all the substrings- method

using a new method, filter the palindromes from the list of substrings
iterate over the list of substrings
skip the substring if it is only one letter? or
check that the substring is equivalent to the substring in reverse AND that it
is longer than one letter
if the substring meets those criteria, append it to a new array


=end

def leading_substrings(string)
  string.size.times.each_with_object([]) do |time, array|
    array << string[0..time]
  end
end

def substrings(string)
  substrings = []
  string.size.times do |index|
    substrings += leading_substrings(string[index..-1])
  end
  substrings
end

def palindromes(string)
  substrings(string).select do |substring|
    substring == substring.reverse && substring.size > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
