puts "Enter a name:"
name = gets.chomp.strip
name = 'Teddy' if name.empty?
puts "#{name} is #{rand(20..200)} years old!"
