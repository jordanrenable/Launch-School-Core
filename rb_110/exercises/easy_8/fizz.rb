=begin
def fizzbuzz(int1, int2)
    arr = (int1..int2).map do |x|
        word = x % 3 == 0 ? 'Fizz' : ''
        word += x % 5 == 0 ? 'Buzz' : ''
        word.empty? ? x : word
    end
    puts arr.join(', ')
end
=end



def fizzbuzz(num1, num2)
  arr = (num1..num2).map do |num|
    if num % 3 == 0 && num % 5 == 0 then "FizzBuzz"
    elsif num % 3 == 0 then "Fizz"
    elsif num % 5 == 0 then "Buzz"
    else num
    end
  end
  print arr.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz