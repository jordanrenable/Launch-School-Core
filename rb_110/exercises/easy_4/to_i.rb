=begin
convert a string of numeric characters to its integer equivalent without using
a built in conversion method

hash of string numeric character and integer equivalent?
convert string to array of individual characters
call the value(integer) using the symbol(string)
push each to new array, or transform?
flatten the array?
add number at last index to sum
add number at -2 index * 10 to sum


[7, 8, 5, 4, 1, 3]

index -1 * 1
index -2 * 10
index -3 * 100
1000

pop off the array * 1
pop off the array * 10

['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']

=end

def string_to_integer(string, radix= 10)
  conversion = { '1'=> 1, '2'=> 2, '3'=> 3, '4'=> 4, '5'=> 5, '6'=> 6, '7'=> 7, 
              '8'=> 8, '9'=> 9, '0'=> 0, 'a'=> 10, 'b'=> 11, 'c'=> 12, 'd'=> 13,
              'e'=> 14, 'f'=> 15 }

  sign = string[0] == '-' ? -1 : 1

  integers = string.delete('+-').downcase.chars.map do |char|
    conversion[char]
  end
  
  multiplier = 1
  sum = 0
  loop do
    sum += integers.pop * multiplier
    multiplier *= radix
    break if integers.empty?
  end
  sum * sign
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

p string_to_integer('4D9f', 16) == 19871

p string_to_integer('4321') == 4321
p string_to_integer('-570') == -570
p string_to_integer('+100') == 100