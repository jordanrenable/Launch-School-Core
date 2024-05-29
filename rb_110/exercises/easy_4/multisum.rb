=begin
given a number, first find all the multiples of 3 and 5 that lie between 1 and 
the input number
then add all of those numbers together and return the sum
rules- numbers that appear in multiple should only be counted once
include the input number if it is a multiple

Data Structures
array to hold multiples?

Algorithm
25- multiples of 3 are 3, 6, 9, 12, 15, 18, 21, 24
    multiples of 5 are 5, 10, 15, 20, 25
    
    set counter at 1
    initialize an empty multiples array
    multiply 3 by counter
    if it is less than the input number, push it to a multiples array
    increment counter
    break if 3 *counter is greater than input number
    (while counter * 3 < num?)
    
    do this again for 5
    
    eliminate duplicates
    sum the array (can either use a method, or build with a loop)

=end

def multisum(num)
  (3..num).select { |x| x % 3 == 0 || x % 5 == 0 }.sum
end


def multisum(num)
  (3..num).select { |int| int % 3 == 0 || int % 5 == 0 }.inject(:+)
end


def multisum(num)
  multiples = []
  factors = [3, 5]
  factors.each do |factor|
    counter = 1
    while (factor * counter) <= num
      multiples << factor * counter
      counter += 1
    end
  end
  multiples.uniq.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168