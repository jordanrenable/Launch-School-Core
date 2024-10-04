=begin
Write a method that displays an 8-pointed star in an nxn grid, where n is an odd 
integer that is supplied as an argument to the method. The smallest such star 
you need to handle is a 7x7 grid.


star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *


star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

PROBLEM
input- odd integer 7 or higher
output- an 8 pointed star in a grid that is input x input large
disallow numbers less than 7 and even numbers

EXAMPLES

11 (11 - 3 = 8)
*    *    * no edge stars, 8 / 2 = 4
 *   *   *  1 edge star each side (2), 8 - 2 = 6, 6 / 2 = 3
  *  *  *   2 edge star each side (4), 8 - 4 = 4, 4 / 2 = 2
   * * *    3 edge star each side (6), 8 - 6 = 2, 2 / 2 = 1
    ***     4 edge star each side (8), 8 - 8 = 0, 0 / 2 = 0
*********** input # stars (line input / 2.0 rounded up? or input / 2 + 1 since odd)
repeat the top half in reverse order


DATA STRUCTURES
input- integer
intermediate- variables storing the value of the midway point, and potentially 
the number of edge spaces and center spaces
output- printed star configuration using strings

ALGORITHM
take an integer
disallow integers less than 7 or even

for numbers 0 up to the midway point - 2 (if 11, for 0-4; if 9, for 0-3)
for each number, save the iteration number as the edge space number
  using the edge space number, find and save the number of center spaces
  print edge spaces * center spaces * center spaces * edge spaces
  (" " * edgespaces, " " * centerspaces)

then print "*" * input integer

repeat the above but instead of 0 through x, x down to 0


def stars_top_half(midway, total_spaces)
  0.upto(midway) do |num|
    edge_spaces = " " * num
    center_spaces = " " * ((total_spaces - (num * 2)) / 2)
    p "#{edge_spaces}*#{center_spaces}*#{center_spaces}*#{edge_spaces}"
  end
end

def stars_bottom_half(midway, total_spaces)
  midway.downto(0) do |num|
    edge_spaces = " " * num
    center_spaces = " " * ((total_spaces - (num * 2)) / 2)
    p "#{edge_spaces}*#{center_spaces}*#{center_spaces}*#{edge_spaces}"
  end
end

 stars_top_half(midway, total_spaces)
stars_bottom_half(midway, total_spaces)

edge_spaces = " " * edge
    center_spaces = " " * ((int - 3 - (edge * 2)) / 2)
    p "#{edge_spaces}*#{center_spaces}*#{center_spaces}*#{edge_spaces}"

=end

def stars(int)
  if  int < 7 || int.even?
    p "Invalid integer"
    return
  end
  midway = (int / 2) - 1

  0.upto(midway) { |edge| print_stars_row(edge, int) }
  p "*" * int
  midway.downto(0) { |edge| print_stars_row(edge, int) }
end

def print_stars_row(edge, int)
    spaces = " " * ((int - 3 - (edge * 2)) / 2)
    p "*#{spaces}*#{spaces}*".center(int)
end


stars(7)
stars(9)
stars(11)