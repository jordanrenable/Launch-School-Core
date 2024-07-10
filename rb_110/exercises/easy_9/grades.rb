=begin
write a method that determines the mean (average) if the three scores passed to
it, and returns the letter value associated with that grade

tested values will be between 0-100. no need to check for negative values or
greater than 100 values

def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end
=end

GRADES = {(100..) => 'A+',
          (90..100) => 'A',
          (80...90) => 'B',
          (70...80) => 'C',
          (60...70) => 'D',
          (0...60) => 'F'}

def get_grade(*nums)
  average = nums.sum / nums.size
  GRADES.each do |k, v|
    return v if k.include?(average)
  end
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"