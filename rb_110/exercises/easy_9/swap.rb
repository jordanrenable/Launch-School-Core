=begin
write a method that takes a first name, a space, and a last name passed as a 
single string argument and returns a string that contains the last name, a comma,
a space, and the first name

take the string which includes two names
split the two names apart
put them back together with the second name first, a comma, a space, then the 
first name

def swap_name(string)
  names = string.split
  first = names[0]
  last = names[-1]
  "#{last}, #{first}"
end

def swap_name(name)
  name.split(' ').reverse.join(', ')
end

def swap_name(name)
  first, last = name.split; "#{last}, #{first}"
end

=end

def swap_name(string)
  names = string.split
  "#{names.last}, #{names.first}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'