=begin
right- one angle is 90 degrees
acute- all 3 angles less than 90 degrees
obtuse- one angle is greater than 90 degrees

to be valid, the sum of all angles must equal 180 degrees, and all must be
greater than 0

write a method that takes 3 angles and returns a symbol, :right, :acute, :obtuse,
or :invalid

assume integer valued angles and don't worry about float point errors


def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  return :invalid if angles.sum != 180 || angles.any? { |el| el <= 0 }
  
=end

def triangle(ang1, ang2, ang3)
  angles = [ang1, ang2, ang3]
  return :invalid if angles.sum != 180 || angles.include?(0)
  if angles.count(90) == 1
    :right
  elsif angles.all? { |ang| ang < 90 }
    :acute
  else
    :obtuse
  end
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid