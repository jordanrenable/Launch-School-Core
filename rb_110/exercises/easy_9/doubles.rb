=begin
double numbers are numbers with an even number of digits whose left-side digits
are exactly the same as the right side digits. for example, 44, 3333, 103103,
7676. write a method that returns 2 times the number provided as an arugment
unless the argument is a double number. double numbers should be returned as is.

double number method- take an integer, convert to a string for easier handling
check that the size of the number string is even or odd
if it is odd, return false
if it is even, divide the length of the number by 2 and split the string from 
index 0 - the middle index. check that the left side digits equal the right side
digits
if they match, return true
if not, return false

double method- take the input number and pass it to the double number method
if it returns true, return the number as is
if it returns false, return the number * 2

def twice(num)
  mid = num.to_s.size / 2
  return num if num.to_s[0...mid] == num.to_s[mid..-1]
  num * 2
end

def twice(num)
  left, right = num.divmod(10**(num.digits.size / 2))
  left == right ? num : num * 2
end

=end

def double_number?(integer)
  num = integer.to_s
  return false if num.size.odd?
  middle = num.size / 2
  num[0...middle] == num[middle..-1]
end

def twice(integer)
  double_number?(integer) ? integer : integer * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10