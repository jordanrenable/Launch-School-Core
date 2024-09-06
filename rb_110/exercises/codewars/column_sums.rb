=begin
Given a grid of values represented by an array of arrays, e.g.:
[1, 2, 3],
[4, 5, 6],
[7, 8, 9]

Return the largest sum of a column of values in the grid.
In this example, the largest sum is 18.

a = [[1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]]

largest_column(a) == 18

b = [[1, 2, 3, 4],
    [5, 6, 7, 8]]
    
largest_column(b) == 12

c = [[1, 0, 0],
     [5, 8, 10],
     [3, 5, 1]]
     
largest_column(c) == 13

PROBLEM
given an array of 3 subarrays, the values represent a grid. the array and 
subarrays can be different sizes
find and return the largest sum of a column

EXAMPLES
[1, 2, 3]
[4, 5, 6]
[7, 8, 9]
12 15 18
array has a size of 3, each sub array has size of 3
sum elements from each subarray at the same index

arr[0][0] + arr[1][0] + arr[2][0]
arr[0][1] + arr[1][1] + arr[2][1]
arr[0][2] + arr[1][2] + arr[2][2]
3 times (0-2), for each of the 3 indices (0-2)

[1, 2, 3, 4]
[5, 6, 7, 8]
6  8  10  12
array has size of 2, each sub array has size of 4
sum= 0
arr[0][0] + arr[1][0] + arr[2][0] + arr[0][3]
then push sum to sums
sum= 0
arr[0][1] + arr[1][1] + arr[2][1] + arr[1][3]
then push sum to sums
2 times (0-1), for each of the 4 indices (0-3)


DATA STRUCTURES
input- array of subarrays
intermediate- array to store possible sums
variable to store the sum on each iteration?
output- integer

ALGORITHM
take an array of arrays
create an array to hold sums

check the size of the array and save it to a variable- first
check the size of the subarray and save it to a variable- second

*first* number of times
initialize a variable to hold the individual sums?
  *second* for each index (times? upto?)
    add the value to the sum
    push the sum to the sums array

return the largest sum from the sums array

=end

def largest_column(array)
  rows = array.size
  columns = array[0].size
  sums = []
  columns.times do |ind2|
    sum = 0
    rows.times do |ind1|
      sum += array[ind1][ind2]
    end
    sums << sum
  end
  sums.max
end


a = [[1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]]

p largest_column(a) == 18

b = [[1, 2, 3, 4],
    [5, 6, 7, 8]]
    
p largest_column(b) == 12

c = [[1, 0, 0],
     [5, 8, 10],
     [3, 5, 1]]
     
p largest_column(c) == 13