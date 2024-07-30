=begin
equilateral = all 3 sides equal
isoceles = 2 sides equal, 3rd different
scalene = 3 sides all different

to be a valid triangle, all side lengths must be greater than 0
the sum of the two shortest sides must be greater than the longest

write a method that takes the lengths of a triangle as arguments and returns a
symbol :equilateral, :isoceles, :scalene, or :invalid

def triangle(a, b, c)
  array = [a, b, c].sort
  return :invalid if array[0, 2].sum <= array[2]
  case array.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

def valid?(sides)
  sides.all? { |el| el > 0 } && (sides[0] + sides[1]) > sides[2]
end
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if sides.any? { |el| el <= 0 } || sides[0..1].sum <= sides[2]
    :invalid
  else
    if side1 == side2 && side2== side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side3 == side1
      :isosceles
    else
      :scalene
    end
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid