puts "What is your age?"
age = gets.to_i
puts "At what age do you anticipate retiring?"
retirement_age = gets.to_i

work_years_left = retirement_age - age
year = Time.now.year
retirement_year = year + work_years_left
puts "It is #{year}. You will retire in #{retirement_year}."
puts "Only #{work_years_left} years of work to go!"
