=begin
return true if a number is prime, false if not.

all even number above 2 are not prime.

for all odd numbers, iterate over the range from 1 to the number, checking the
modulus. if the modulus is 0, add the number to a factors variable.
check the factor size- if it is 2, then the number is prime

def is_prime(int)
  return false if int > 2 && int % 2 == 0
  return false if int == 1
  factors = []
  for num in (1..int)
    if int % num == 0
      factors << num
    end
  end
  factors.size == 2
end


def is_prime(int)
  return false if int == 1
  factors = []
  for num in (1..int)
    if int % num == 0
      factors << num
      return false if factors.size > 2
    end
  end
  true
end

def is_prime(int)
  return false if int == 1
  factors = []
  for num in (1..int/2)
    div, mod = int.divmod(num)
    if mod == 0
      factors += [num, div]
      return false if factors.size > 2
    end
  end
  true
end

def is_prime(int)
  return false if int == 1
  for num in (2..int/2)
    if int % num == 0
      return false
    end
  end
  true
end
=end

def is_prime(int)
  return false if int == 1
  return false if int > 2 && int % 2 == 0
  for num in (3..int/2 - 1)
    if int % num == 0
      return false
    end
  end
  true
end

puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true