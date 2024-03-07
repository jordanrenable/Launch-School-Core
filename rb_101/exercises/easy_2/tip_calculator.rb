puts "How much is the bill?"
bill = gets.to_f.round(2)
puts "What percentage would you like to tip?"
tip_percent = gets.to_f.round(2) / 100
tip = (bill * tip_percent).round

total = (bill + tip).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"
