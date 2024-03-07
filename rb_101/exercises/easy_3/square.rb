def multiply(x, y)
  x * y
end

def square(num)
  multiply(num, num)
end

puts square(5) == 25
puts square(-8) == 64

def to_nth_power(num, power)
  result = 1
  power.times { result = multiply(result, num) }
  result
end

puts to_nth_power(5, 5)
puts to_nth_power(2, 2)
puts to_nth_power(4, 3)
