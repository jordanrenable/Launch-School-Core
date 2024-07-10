=begin
write a method that takes 2 arguments, an array and a hash. the array will
contain 2 or more elements that when combined with spaces will produce a person's
name. the hash will contain two keys, title and occupation and their values.
your method should return a greeting that uses the person's full name and their
title and occupation


def greetings(array, hash)
   "Hello, #{array.join(' ')}! Nice to have a #{hash[:title]} " + 
   "#{hash[:occupation]} around."
end
=end

def greetings(array, hash)
  name = array.join(' ')
  title = hash.values.join(' ')
   "Hello, #{name}! Nice to have a #{title} around."
end


p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }) ==
"Hello, John Q Doe! Nice to have a Master Plumber around."