array = []
puts "==> Enter the 1st number:"
array << gets.to_i
puts "==> Enter the 2nd number:"
array << gets.to_i
puts "==> Enter the 3rd number:"
array << gets.to_i
puts "==> Enter the 4th number:"
array << gets.to_i
puts "==> Enter the 5th number:"
array << gets.to_i
puts "==> Enter the last number:"
last_num = gets.to_i

if array.include?(last_num)
  puts "==> The number #{last_num} appears in #{array}."
else
  puts "==> The number #{last_num} does not appear in #{array}."
end
