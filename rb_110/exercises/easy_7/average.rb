=begin
write a method that takes an array of integers, multiplies all the numbers
together, divides the result by the number of integers, then prints the result
rounded to 3 decimal places

take an array of integers
multiply all of the digits together
divide the product by the number of integers in the array
print the multi ave rounded to 3 decimals



puts "The result is #{format('%.3f', average)}"
puts format(("The result is %.3f"), result)

=end
def show_multiplicative_average(array)
  result = array.inject(:*) / array.size.to_f
  puts 'The result is %.3f' % (result)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667