DAY = [0, 0]
NIGHT = [-23, -60]
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY


def after_midnight(string)
  hours = string[0, 2].to_i
  minutes = string[-2, 2].to_i
  
  
  (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
  
end

def before_midnight(string)
  hours = string[0, 2].to_i
  minutes = string[-2, 2].to_i
  
  minutes += hours * MINUTES_PER_HOUR
  
  minutes == 0 ? 0 : MINUTES_PER_DAY - minutes
  
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

=begin
Problem
take a string which represents the time, break it down to the number of minutes 
it is either before midnight (subtract from midnight) or after midnight (add to
midnight)

do not need negative signs, it is simply the number of minutes before or after
00:00 and 24:00 both equal midnight

Data Structures

Algorithm
take a string

convert the numbers to integers and save those in variables representing the
hours and minutes

convert the hours to minutes

before midnight- subtract from total number of minutes in day
after midnight return the number of minutes

=end