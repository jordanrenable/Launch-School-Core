=begin
Write a method that takes a floating point number that represents an angle 
between 0 and 360 degrees and returns a String that represents that angle in 
degrees, minutes and seconds. You should use a degree symbol (°) to represent 
degrees, a single quote (') to represent minutes, and a double quote (") to 
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: You can use the following constant to represent the degree symbol:

rules
two digit numbers should use leading zeros


take a decimal number which represents an angle
validate between 0-360

convert to string- split at the decimal
save the first half to degrees, save the second half in minutes
add the decimal back to the beginning of minutes
convert degrees back to int
convert minutes back to float

multiply minutes by minutes_per_degree
convert to string, split at the decimal
save the first half to minutes, save the second half to seconds var
save the seconds var to equal the seconds var multiplied by seconds per minute


format the minutes and seconds so they have a leading zero
return the angle in string form with degree, minutes, seconds

=end

DEGREE = "\u00B0"
MINUTES_PER_DEGREE = 60.0
SECONDS_PER_MINUTE = 60
MAX_DEGREE = 360

def convert(angle)
  first, second = angle.to_f.to_s.split('.')
  first = first.to_i
  second = second.prepend('.').to_f
  [first, second]
end

 # def normalize(angle)
 #     angle += 360
 #   end
 #   until angle < 360
 #     angle -= 360
 #   end
 #   angle
 # end

def dms(angle)
  angle = angle % MAX_DEGREE
  
  degrees, minutes = convert(angle)
  minutes *= MINUTES_PER_DEGREE
  minutes, seconds = convert(minutes)
  seconds = (seconds * SECONDS_PER_MINUTE).round(0)
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end


puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")
