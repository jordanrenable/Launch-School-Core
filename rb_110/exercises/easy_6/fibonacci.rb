=begin
take an integer as an argument
return the number it is in the sequence (if the Ruby index is 6, the return 
value should be 7) of the first fibonacci number that has the argument number of 
digits

if the argument is 2, the first fibonacci number with 2 digits is 13
it is the 7th fibonacci number, return 7

input- integer
output-integer
intermediate- array of fibonacci numbers

build an array of fibonacci numbers 
as you build the array, check to see if the length of the last integer to string 
is equal to the input integer

if it is equal, return the size of the array

def find_fibonacci_index_by_length(length)
  fibonacci_numbers = [1, 1, 2]
  until fibonacci_numbers.last.to_s.size >= length
    fibonacci_numbers << fibonacci_numbers[-1] + fibonacci_numbers[-2]
  end
  fibonacci_numbers.size
end
# 17.830026   0.087317  17.917343 ( 18.429741)

def find_fibonacci_index_by_length(length)
  a = 1
  b = 2
  fibonacci_numbers = [1, 1, 2]
  until b.to_s.size >= length
    fibonacci_numbers << a + b
    a, b = b, a + b
  end
  fibonacci_numbers.size
end
17.966521   0.110257  18.076778 ( 18.527499)

def find_fibonacci_index_by_length(length)
  fibonacci_numbers = [1, 1, 2]
  until fibonacci_numbers[-1].to_s.size >= length
    fibonacci_numbers << fibonacci_numbers[-1] + fibonacci_numbers[-2]
  end
  fibonacci_numbers.size
end
18.101592   0.069174  18.170766 ( 18.626244)

def find_fibonacci_index_by_length(length)
  a = 1
  b = 2
  fibonacci_numbers = [1, 1, 2]
  until fibonacci_numbers.last.to_s.size >= length
    fibonacci_numbers << a + b
    a, b = b, a + b
  end
  fibonacci_numbers.size
end
18.030104   0.121548  18.151652 ( 18.851221)


=end



require 'benchmark'



=begin
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
=end

puts Benchmark.measure { find_fibonacci_index_by_length(10000) }