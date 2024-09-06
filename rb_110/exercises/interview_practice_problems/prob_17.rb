=begin
Create a method that takes an array of integers as an argument. The method 
should determine the minimum integer value that can be appended to the array so 
the sum of all the elements equal the closest prime number that is greater than 
the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. 
The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to 
sum to 7.

Notes:

The array will always contain at least 2 integers.
All values in the array must be positive (> 0).
There may be multiple occurrences of the various numbers in the array.

PROBLEM
input- array of integers
output- integer, which is the integer that will take the current sum to equal 
the next highest prime number

EXAMPLES

DATA STRUCTURES
input- array
intermediate- helper methods? 
output- integer

ALGORITHM
take an array
find the sum of the integers in the array- save it to a variable?
** find the nearest prime number
  from starting sum (plus 1) to infinity, save the number if it is prime

  **determine if a number is prime
    a number is prime if it only has two multiples, 1 and itself. 
    take a number
    if the number is 1, 2, or 3, it is prime
    from 2 to (number in question / 2 - 1) (call it top?)
      if the top is evenly divisble by the multiple, then it is not prime. 
      return false (skip even numbers bc we already know if it is even)


subtract the starting array sum from the next_prime number and return

=end

def nearest_prime_sum(array)
  sum = array.sum
  next_prime(sum + 1) - sum
end

def next_prime(int)
  (int..).each do |num|
    return num if is_prime?(num)
  end
end

def is_prime?(int)
  return true if (2..3).include?(int)
  return false if int % 2 == 0
  top = int / 2
  3.step(top, 2) do |num|
    return false if int % num == 0
  end
  true
end


p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4


=begin
167
1 2 3? return true
return false if 167 evenly divisble by 2
top = (167 / 2)
from 3 to top (83) |num|
  return false if input (167) % num == 0

  return true

=end