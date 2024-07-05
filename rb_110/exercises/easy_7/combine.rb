=begin
write a method that combines two arrays passed as arguments and returns a new
array that contains all elements from both array arguments with the elements
taken in alternation

given two arrays, take the first element from the first array and put it into a 
new array
then take the first element of the second array and put it into the new array
then take the second element of the first array and put it into the new array
then take the second element of the second array and put it into the new array
repeat


OR
take the first array and insert each element from the second array into the
first at the odd indices (1, 3, 5)



def interleave(arr1, arr2)
  copy = arr1.dup
  index = 1
  arr2.each do |val|
    copy.insert(index, val)
    index += 2
  end
  copy
end



def interleave(arr1, arr2)
  arr1.zip(arr2).flatten(1)
end

=end

def interleave(arr1, arr2)
  combine = []

  arr1.zip(arr2) do |sub_array|
    sub_array.each { |element| combine += [element] }
  end

  combine
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']