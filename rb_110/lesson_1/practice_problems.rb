# turn array to hash where names are keys and position in array is value
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

hash = {}

flintstones.each_with_index do |name, index|
  hash[name] = index
end

p hash

# add all the ages from the hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.sum

# remove people aged 100 and older
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.delete_if do |key, value|
  value >= 100
end

p ages

# pick minimum age from hash
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.min

# find index of first name starting with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  if name.start_with?("Be")
    puts index
  else
    next
  end
end

# change the array below so all names are shortened to the first three characters
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |name, index|
  flintstones[index] = name.slice(0..2)
end

p flintstones

# create hash expressing frequency each letter occurs in the string
statement = "The Flintstones Rock"

array = statement.delete(' ').downcase.chars

letter_frequency = array.each_with_object({}) do |letter, hash|
                    unless hash.key?(letter)
                      hash[letter] = 1
                    else
                      hash[letter] += 1
                    end
                  end

p letter_frequency

# write your own version of titleize implementation
words = "the flintstones rock"

words = words.split.each do |word|
  word.capitalize!
end

words = words.join(' ')

puts words

# modify the hash so each member has an age group key/value pair
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.values.each do |element|
  case element["age"] 
    when 0..17 then element["age_group"] = "kid"
    when 65.. then element["age_group"] = "senior"
    when 18..64 then element["age_group"] = "adult"
  end
end 

p munsters
