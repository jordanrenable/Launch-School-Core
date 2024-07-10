=begin
write a method that returns an array containing every other element of the array passed as an argument. the values in the returned list should be those that are in the 1st, 3rd, 5th and so on elements of the argument array

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

def oddities(array, even= true)
  array.each_with_object([]).with_index do |(el, list), index|
    if even
      list << el if index.even?
    else
      list << el if index.odd?
    end
  end
end

def oddities(array)
  array.each_with_object([]).with_index do |(el, list), index|
      list << el if index.even?
  end
end

def oddities(array, even= true)
  array.each_with_object([]).with_index do |(el, list), index|
      list << el if even ? index.even? : index.odd?
  end
end

def oddities(array, even= true)
  array.each_with_object([]).with_index do |(el, list), index|
      list << el if even ? index.even? : index.odd?
  end
end

def oddities(arr)
  p arr.select.with_index { |_, i| i.even?}
end

def interleave(arr, evens:false)
  arr.select.with_index { |_, i| evens ? i.odd? : i.even? }
end

def oddities(arr)
  arr.map.with_index { |x, i| i.even? ? x : nil }.compact
end

=end

def oddities(array, even_index=true)
  start_index = even_index ? 0 : 1
  results = []
  until start_index >= array.size
    results << array[start_index]
    start_index += 2
  end
  results
end


p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

p oddities([1, 2, 3, 4, 5], false) == [2, 4]