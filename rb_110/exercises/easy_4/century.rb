=begin
Problem
given an integer which represents a year, return a string representing which
century the year belongs to, with the appropriate suffix

Examples
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

Data Structures
0-100 1st
101-200 2nd
201-300 3rd

100/100 = 1
101/100 = 1.01
10103/100 = 


Algorithm
input- integer
output- string

given an integer, divide that integer by 100
round up the quotient to nearest integer  (ceil)

convert to string
if second to last character is 1, add 'th'
if last  character is 1, add "st"
if last character is 2, add "nd"
if last character is 3, add 'rd'
or if last character is anything else, add 'th'
=end

def century(year)
  century = (year / 100.0).ceil.to_s
  
  if century[-2] == '1'
    century + 'th'
  elsif century[-1] == '1'
    century + 'st'
  elsif century[-1] == '2'
    century + 'nd'
  elsif century[-1] == '3' 
    century + 'rd'
  else 
    century + 'th'
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'