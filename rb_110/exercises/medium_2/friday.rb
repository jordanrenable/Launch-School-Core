=begin
write a method that returns the number of Friday the 13ths in the year given by
an argument. assume the year is greater than 1752 (when UK adopted modern 
Gregorian calendar) and that it will remain in use for the forseeable future.


require 'date'

check the 13th of each month for that year
if the day is a friday, increment a counter by 1
return the counter

require 'date'

def five_fridays(year)
  (1..12).count do |month|
    current_month = Date.new(year, month)
    (current_month...current_month.next_month).count(&:friday?) == 5
  end
end

=end

require 'date'

def friday_13th(year)
  fridays = 0
  for month in 1..12
    fridays += 1 if Time.new(year, month, 13).friday?
  end
  fridays
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2

=begin
count how many months have 5 fridays
must account for leap years

Date.new(year).leap?

if it is a leap year and Date.new(year, 2, 1).friday?
has 5 fridays

for the rest of the months- 

for any month, if year, month, 1 or year, month, 2 is friday?
5 fridays

jan, mar, may, jul, aug, oct, dec
&& the year, month, 1..3 is friday
or, 1 is wednesday, thursday, or friday?

=end


THIRTY = [4, 6, 9, 11]
THIRTY_ONE = [1, 3, 5, 7, 8, 10, 12]

require 'date'

def five_friday_months(year)
  five_fri = 0

  five_fri +=1 if Date.new(year).leap? && Time.new(year, 2, 1).friday?
  for month in THIRTY_ONE
    five_fri += 1 if ([3, 4, 5]).include?(Time.new(year, month, 1).wday)
  end
  for month in THIRTY
    five_fri += 1 if ([4, 5]).include?(Time.new(year, month, 1).wday)
  end
  five_fri
end


p five_friday_months(2000)
p five_friday_months(2001)
p five_friday_months(2002)
p five_friday_months(2003)
p five_friday_months(2004)
p five_friday_months(2005)
p five_friday_months(2006)
p five_friday_months(2007)
p five_friday_months(2008)
p five_friday_months(2009)
p five_friday_months(2010)
p five_friday_months(2011)
p five_friday_months(2012)
p five_friday_months(2013)
p five_friday_months(2014)
p five_friday_months(2015)