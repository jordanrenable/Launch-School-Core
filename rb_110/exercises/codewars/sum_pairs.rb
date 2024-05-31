=begin

Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== nil 

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

Negative numbers and duplicate numbers can and will appear.

=end

=begin
Problem
given a list of integers and an integer sum value, return the first two individual integers that add up to equal the sum
if there are multiple solutions, choose the pair whose second element has the smallest index 

Examples
see above and below

Data Structures
inputs: an array of integers, an integer
output: pair of integers in array form, or nil
intermediate: array represented by a variable for solution pairs

Algorithm
iterate over the array
for integer at each index, find the sum of that integer and integer at the next index
  compare sum to the sum integer input 
  if it equals the input, save that pair to an array
  if not, move to the next index

if saved pair array is empty, return nil
if array only has one pair, return that pair
if it has multiple solutions, evaluate the index of the second element of each pair
  compare first pairs second element index to next pairs second element index
  return/keep whichever pairs second element has the lower index

Coding

  arr.each_with_index do |int , index|
    for time in (1...arr.size) do
      p time
      if int + arr[time] == num
        pairs << [[int, index], [arr[time], time]]
      end
    end
  end



=end

def sum_pairs(arr, num)
  pairs = []
  arr.each_with_index do |int , index|
    counter = index + 1
    while counter < arr.size
      if int + arr[counter] == num
        pairs << [[int, index], [arr[counter], counter]]
      end
      counter += 1
    end
  end

  if pairs.empty?
    nil
  elsif pairs.size == 1
    [pairs[0][0][0], pairs[0][1][0]]
  else
    lowest_index = arr.size - 1
    lowest = nil
    pairs.each do |pair|
      if pair[1][1] <= lowest_index
        lowest_index = pair[1][1]
        lowest = [pair[0][0], pair[1][0]]
      end
    end
   lowest
  end
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

p sum_pairs(l1, 8)  == [1, 7]
p sum_pairs(l2, -6)  == [0, -6]
p sum_pairs(l3, -7)  == nil
p sum_pairs(l4, 2)  == [1, 1]
p sum_pairs(l5, 10)  == [3, 7]
p sum_pairs(l6, 8)  == [4, 4]
p sum_pairs(l7, 0)  == [0, 0]
p sum_pairs(l8, 10)  == [13, -3]


