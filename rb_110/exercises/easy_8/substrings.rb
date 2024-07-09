=begin
write a method that returns a list of all substrings of a string that start at
the beginning of the original string. return value should be arranged from
shortest to longest

first iteration, return first letter
second iteration, return first-second letter
etc


def leading_substrings(string)
  substrings = []
  string.each_char.with_index do |char, index|
    substrings << string[0..index]
  end
  substrings
end


def leading_substrings(string)
  string.chars.each_with_object([]).with_index do |(_, array), index|
    array << string[0..index]
  end
end


def leading_substrings(string) # iterating directly over the characters
  string.chars.each_index.map { |stop_idx| string[0..stop_idx] }
end

def leading_substrings(string) # iterating over a range I
  (0...string.size).map { |stop_idx| string[0..stop_idx] }
end

def leading_substrings(string) # iterating over a range II
  (1..string.size).map { |length| string[0, length] }
end

def leading_substrings(string) # using #times to iterate
  (string.size).times.map { |stop_idx| string[0..stop_idx] }
end

def leading_substrings(string) # using #upto to iterate
  1.upto(string.size).map { |length| string[0, length] }
end



=end

def leading_substrings(string)
  string.size.times.each_with_object([]) do |time, array|
    array << string[0..time]
  end
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']