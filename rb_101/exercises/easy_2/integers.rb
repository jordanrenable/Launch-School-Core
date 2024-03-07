def valid_number?(number)
  number > 0
end

def valid_operation?(operand)
  operand == 's' || operand == 'p' || operand == 'sum' || operand == 'product'
end

def sum(number)
  (1..number).sum
end

def product(number)
  (1..number).inject(:*)
end

number = 1
operand = ''

loop do
  puts ">> Please enter an integer greater than 0:"
  number = gets.to_i
  if valid_number?(number)
    break
  else
    puts ">> I'm sorry. That is not a valid integer."
  end
end

loop do
  puts ">> Would you like to calculate the sum or product of all integers 1 " \
       "to #{number}?"
  puts ">> Enter 's' for sum, 'p' for product."
  operand = gets.chomp.downcase
  if valid_operation?(operand)
    break
  else
    puts ">> I'm sorry. That is not a valid input."
  end
end

if operand == 's' || operand == 'sum'
  puts ">> The sum of integers from 1 to #{number} is #{sum(number)}."
else
  puts ">> The product of integers from 1 to #{number} is #{product(number)}."
end
