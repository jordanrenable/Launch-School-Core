=begin
Problem
write a method that takes an integer representing a year as an argument,
determines if the year is a leap year, and returns true or false

input- integer
output- boolean

rules- leap year is true if the year is evenly divisible by 400
true if evenly divisible by 4 and not evenly divisble by 100


Examples
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true


Data Structures

Algorithm
given a number- 
if the number is less than or equal to 1752, is it evenly divisble by 4
if the number is greater than 1752, 
if the remainder of the number divided by 400 is 0, true
else if the remainder of the number divided by 4 is 0 and the remainder of the
number divided by 100 is NOT zero, true
else false

=end

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  elsif year % 400 == 0
    true
  elsif year % 4 == 0 && year % 100 != 0
    true
  else
    false
  end
end

=begin
p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
=end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true