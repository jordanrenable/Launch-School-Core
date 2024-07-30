=begin
bubble sort is one of the simplest sorting algorithms available.

a bubble sortmakes multiple passes through an array, on each pass, comparing
each pair of consecutive elements. if the second is greater than the first, the
two are swapped. this is repeated until a full pass is made without swaps.

write a method that takes an array as an argument and sorts using the bubble
sort algorithm. sort "in-place", meaning mutate the array

iterate over the array an unknown number of times
loop? break if a swap count is 0


def bubble_sort!(arr)
  n = arr.size - 2
  loop do
    newn = 0
    (0..n).each do |ind|
      if arr[ind] > arr[ind + 1]
        arr[ind], arr[ind + 1] = arr[ind + 1], arr[ind]
        newn = ind
      end
    end
    n = newn
    break if n == 0
  end
  arr
end

=end

def bubble_sort!(arr)
  swaps = 0
  loop do
    arr.each_with_index do |el, ind|
      if (el <=> arr[ind + 1]) == 1
        arr[ind], arr[ind + 1] = arr[ind + 1], el
        swaps += 1
      end
    end
    break if swaps == 0
    swaps = 0
  end
  arr
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)