puts "How much is the bill?"
bill = gets.to_f.round(2)
puts "What percentage would you like to tip?"
tip_percent = gets.to_f.round(2)
tip = (bill * (tip_percent / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{format('%.2f', tip)}"
puts "The total is $#{format('%.2f', total)}"
