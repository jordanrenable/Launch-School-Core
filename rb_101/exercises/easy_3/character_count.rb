puts "==> Enter a word or series of words:"
string = gets.chomp
puts "==> There are #{string.delete(' ').size} characters in '#{string}'."
