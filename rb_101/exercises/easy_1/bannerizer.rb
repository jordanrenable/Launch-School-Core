def print_in_box(string)
  if string.size <= 76
    puts "+-#{''.rjust(string.size, '-')}-+"
    puts "| #{''.rjust(string.size, ' ')} |"
    puts "| #{string} |"
    puts "| #{''.rjust(string.size, ' ')} |"
    puts "+-#{''.rjust(string.size, '-')}-+"
  elsif string.size > 76 && string.size < 152
    array = string.split
    if array.size.even?
      words = (array.size / 2) - 1
    else
      words = ((array.size + 1) / 2) - 1
    end
    line_1 = array[0..words].join(' ')
    line_2 = array[(words + 1)..array.size].join(' ')
    if line_1.size > line_2.size
      padding = line_1.size
      buffer = line_1.size - line_2.size
    else
      padding = line_2.size
      buffer = line_2.size - line_1.size
    end
    puts "+-#{''.rjust(padding, '-')}-+"
    puts "| #{''.rjust(padding, ' ')} |"
    puts "| #{line_1} |"
    puts "| #{' ' * (buffer / 2)}#{line_2}#{' ' * (buffer - (buffer / 2))} |"
    puts "| #{''.rjust(padding, ' ')} |"
    puts "+-#{''.rjust(padding, '-')}-+"
  else
    puts "I'm not equipped to handle a string of that size."
  end
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('This string has more than seventy six characters and should be split into two lines.')
print_in_box('This string is meant to exceed the number of characters this method is built to accommodatejkh uhhhh jjjgfff jjjjjjjj gggfffdd hhg jhgff jhggffff jjhgfffg  hggffff')