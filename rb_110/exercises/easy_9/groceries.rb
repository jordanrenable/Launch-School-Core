=begin
write a method that takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit


def buy_fruit(array)
  list = []
  array.each do |fruit, count|
    count.times { list << fruit }
  end
  list
end

******
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

def buy_fruit(arr)
  arr.flat_map { |fruit| [fruit[0]] * fruit[1] }
end

=end

def buy_fruit(arr)
  arr.each_with_object([]) { |(fruit, num), list| num.times { list << fruit } }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]