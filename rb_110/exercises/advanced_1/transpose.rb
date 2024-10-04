=begin
transpose a 3x3 nested array

PROBLEM
take a nested array containing 3 elements each with 3 elements
transpose the array so the columns become the rows

initialize an empty array

establish the number of columns and rows

=end

def transpose(array)
  new_array = []
  rows = array.size - 1
  columns = array[0].size - 1

  0.upto(columns) do |column|
    sub_array = []
    0.upto(rows) do |row|
      sub_array << array[row][column]
    end
    new_array << sub_array
  end
  new_array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]


=begin
further exploration
Write a transpose! method that transposes a matrix in place. The obvious 
solution is to reuse transpose from above, then copy the results back into the 
array specified by the argument. For this method, don't use this approach; write 
a method from scratch that does the in-place transpose.

[1, 5, 8] [0][0] for [0][0] ; [0][1] for [1][0] ; [0][2] for [2][0]
[4, 7, 2] [1][0] for [0][1] ; [1][1] for [1][1] ; [1][2] for [2][1]
[3, 9, 6] [2][0] for [0][2] ; [2][1] for [1][2] ; [2][2] for [2][2]

multiple variable reassignment?
how to track what's already been swapped?

only switch if the first index is less than the second index?
=end

def transpose!(array)
  rows = array.size
  columns = array[0].size
  
  rows.times do |row|
    columns.times do |column|
    if column > row
      array[row][column], array[column][row] = array[column][row], array[row][column]
    end
    end
  end
  p array
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]


def transpose(array)
  rows = array.size
  columns = array[0].size
  new_array = []
  
  columns.times do |column|
    sub_array = []

    rows.times do |row|
      sub_array << array[row][column]
    end
  
    new_array << sub_array
  end

  p new_array
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]


def rotate90(array)
  rows = array.size
  columns = array[0].size
  new_array = []
  
  (0...columns).each do |column|
    sub_array = []

    (rows - 1).downto(0) do |row|
      sub_array << array[row][column]
    end
  
    new_array << sub_array
  end

  new_array
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

def rotate(array, degrees=90)
  new_array = array
  (degrees / 90).times { new_array = rotate90(new_array) }
  new_array
end

def rotate90(array)
  rows = array.size
  columns = array[0].size
  new_array = []
  
  (0...columns).each do |column|
    sub_array = []

    (rows - 1).downto(0) do |row|
      sub_array << array[row][column]
    end
  
    new_array << sub_array
  end
  new_array
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p rotate(matrix1)
p rotate(matrix1, 180)
p rotate(matrix1, 270)
p rotate(matrix1, 360)

p rotate(matrix2)
p rotate(matrix2, 180)
p rotate(matrix2, 270)
p rotate(matrix2, 360)