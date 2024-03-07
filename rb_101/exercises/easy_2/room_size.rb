SQMETER_TO_SQFOOT = 10.7639
puts "Enter the length of the room in meters:"
length_in_meters = gets.to_f
puts "Enter the width of the room in meters:"
width_in_meters = gets.to_f
square_meters = (length_in_meters * width_in_meters).round(2)
puts "The area of the room is #{square_meters} square meters (#{square_meters * SQMETER_TO_SQFOOT} square feet)."

SQFOOT_TO_SQINCH = 144
SQFOOT_TO_SQCM = 929.03
puts "Enter the length of the room in feet:"
length_in_feet = gets.to_f
puts "Enter the width of the room in feet:"
width_in_feet = gets.to_f
square_feet = (length_in_feet * width_in_feet).round(2)
square_inches = (square_feet * SQFOOT_TO_SQINCH).round(2)
square_centimeters = (square_feet * SQFOOT_TO_SQCM).round(2)
puts "The area of the room is #{square_feet} square feet (#{square_inches} " + \
      "square inches, #{square_centimeters} square centimeters)."
