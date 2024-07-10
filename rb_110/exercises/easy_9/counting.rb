=begin
write a method that takes an integer argument and returns an array of all
integers in sequence between one and the argument

*** (1..number).to_a ***


def sequence(integer)
  (1..integer).each_with_object([]) { |int, arr| arr << int }
end
=end

def sequence(integer)
  if integer > 0
    (1..integer).to_a
  else
    (integer..1).to_a.reverse
  end
end


p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]
p sequence(-5) == [1, 0, -1, -2, -3, -4, -5]