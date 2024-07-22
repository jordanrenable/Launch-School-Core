=begin
write a method that displays a 4 pointed diamond in an n x n grid, where n is an
odd integet that is supplied as an argument. you may assume that the argument
will always be an odd integer


given an odd integer, print a diamond (using asterisks)
where the number of lines is equal to the argument
the center line is the argument # long
starting from the first line, it increases by 2 (odd numbers)
until it hits the argument size

argument is 9
1
3
5
7
9
7
5
3
1

the asterisks must be centered to create the appearance of a diamond

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

****
def diamond(int)
  stars = 1

  1.upto(int) do |line|
    puts ('*' * stars).center(int)
    line > (int / 2) ? stars -= 2 : stars += 2
  end
end

def empty_diamond(number)
  base = []
  (1..number).step(2) do |step|
    string = '*'
    string += ' ' * (step - 2) + '*' if step > 1
    base << string.center(number)
  end
  puts base[0..-2] + base.reverse
end

def stars(num, mid)
  first = (num - mid) / 2
  second = -(first + 1)
  string = ' ' * num
  string[first] = '*'
  string[second] = '*'
  string
end

=end

def diamond(num)
  middle = 1
  until middle == num
    puts ('*' * middle).center(num)
    middle += 2
  end
  until middle < 1
    puts ('*' * middle).center(num)
    middle -= 2
  end
end

diamond(3)
diamond(9)

def stars(mid)
  string = ' ' * mid
  string[0] = '*'
  string[-1] = '*'
  string
end

def diamond_outline(num)
  middle = 1
  until middle == num
    puts stars(middle).center(num)
    middle += 2
  end
  until middle < 1
    puts stars(middle).center(num)
    middle -= 2
  end
end

diamond_outline(3)
diamond_outline(9)
diamond_outline(5)