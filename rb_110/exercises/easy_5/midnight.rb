=begin
The time of day can be represented as the number of minutes before or after
midnight. If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer
input.

You may not use ruby's Date and Time classes.

Problem
given an integer which represents a number of minutes with either a positive or
negative, return the time of day in hh:mm format by counting either forward from
00:00 if positive or backwards from 24:00 if negative

Examples
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Data Structures
input- positive or negative integer
output- string representing time in hh:mm format
intermediate- variables representing the number of hours and number of minutes
variables representing the base hour and base minute

Algorithm
establish base time for before midnight vs after midnight
before midnight= 24:60
after midnight= 00:00

take an integer
determine how many hours and minutes it is by dividing the absolute value by 60
the quotient is the hours and the remainder is the minutes
save these numbers to variables
if the hours exceeds 24, obtain the modulo of dividing by 24

determine if number was positive or negative
if the number is positive, add the number of hours and minutes to after midnight
variables
if negative, subtract (the absolute values of) the hours and minutes from after
midnight variables
return the hour in string form joined to the minute in string form by a colon
=end

DAY = [0, 0]
NIGHT = [-23, -60]
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

=begin
def time_of_day(integer)
  hours, minutes = integer.abs.divmod(MINUTES_PER_HOUR)
  
  hours = hours % HOURS_PER_DAY if hours > HOURS_PER_DAY
  
  base = integer.negative? ? NIGHT : DAY
  hours = (base[0] + hours).abs
  minutes = (base[1] + minutes).abs
  
  sprintf('%02d', hours) + ':' + sprintf('%02d', minutes)
  
end
=end

def time_of_day(integer)
  time_in_minutes = integer % MINUTES_PER_DAY
  
  hour, minute = time_in_minutes.divmod(MINUTES_PER_HOUR)
  
  format('%02d:%02d', hour, minute)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
