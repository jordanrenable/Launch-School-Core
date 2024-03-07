MAX_LENGTH = 76

def print_in_box(string)
  if string.size <= MAX_LENGTH
    puts "+-#{''.rjust(string.size, '-')}-+"
    puts "| #{''.rjust(string.size, ' ')} |"
    puts "| #{string} |"
    puts "| #{''.rjust(string.size, ' ')} |"
    puts "+-#{''.rjust(string.size, '-')}-+"
  elsif string.size > MAX_LENGTH
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
    puts "| #{' ' * (buffer / 2)}#{line_2}#{' ' * (buffer / 2)} |"
    puts "| #{''.rjust(padding, ' ')} |"
    puts "+-#{''.rjust(padding, '-')}-+"
  end
end

def number_of_lines(string)
  (string.size.to_f / MAX_LENGTH).ceil
end

def words_per_line(string)
  words = string.split
  lines = number_of_lines(string)
  (words.size.to_f / lines.to_f).ceil
end

# how to increment line variables for number of words, should I cap the number of characters?
def split_string_to_lines(string)
  words = string.split
  loop do
    
  end
  

words_per_line('odd now how many characters are in this string and how many lines will i need today?')
  
    
    

print_in_box('hello')
print_in_box('To boldly go where no one has gone before.')
print_in_box('This string has more than seventy six characters and should be split into two lines')
