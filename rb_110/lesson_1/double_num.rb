my_numbers = [1, 4, 3, 7, 2, 6]

def double_numbers(numbers, multiplier)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= multiplier

    counter += 1
  end

  numbers
end

p my_numbers

double_numbers(my_numbers, 3)

p my_numbers
