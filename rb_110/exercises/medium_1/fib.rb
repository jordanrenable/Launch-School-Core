=begin
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

#recursive
def fibonacci(int)
  return 1 if int <= 2
  fibonacci(int - 1) + fibonacci(int - 2)
end
=end

#procedural
def fibonacci(int)
  return 1 if int <=2
  counter = 3
  val1 = 1
  val2 = 1
  while counter <= int
    fib = val1 + val2
    val1 = val2
    val2 = fib
    counter +=1
  end
  fib
end
  
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765