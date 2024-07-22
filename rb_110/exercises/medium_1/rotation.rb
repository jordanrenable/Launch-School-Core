=begin
write a method that rotates an array by moving the first element to the end of 
the array. the original array should not be modified. do not use the array 
rotate method.

def rotate_array(array)
  copy = array.dup
  digit = copy.first
  copy << digit
  copy.shift
  copy


def rotate_array(array)
  array[1..-1] + [array[0]]
end


def rotate_object(object)
  if object.class == String
    rotate_array(object.chars).join
  elsif object.class == Integer 
    rotate_array(object.digits.reverse).join.to_i
  elsif object.class == Hash
    rotate_array(object.to_a).to_h
  elsif object.class == Array 
    rotate_array(object)
  end
end

p rotate_object("String")
p rotate_object(7365)
p rotate_object({key: "value", dog: "Bruno", cat: "Mathilda"})
p rotate_object([1, 2, 3, 4])


# 1st attempt
def rotate_array(arr)
  new_arr = arr.dup
  new_arr.append(arr[0]).delete_at(0)
  new_arr
end

# Further exploration incorporating approach from given solution
def rotate(input)
  if input.class == Array
    input[1..-1] + [input[0]]
  elsif input.class == String
    input[1..-1] + input[0]
  elsif input.class == Integer
    (input.to_s[1..-1] + input.to_s[0]).to_i
  end
end

=end

def rotate_array(array)
  copy = array.dup
  copy << copy.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true