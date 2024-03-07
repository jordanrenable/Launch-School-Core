puts "What is your name?"
name = gets.chomp

GREET = "Hello, #{name}."
YELL = "HELLO, #{name.upcase.delete('!')}. WHY ARE WE SCREAMING?"

if name.include?('!') || name == name.upcase
  puts YELL
else
  puts GREET
end
