# order array by descending numeric value
arr = ['10', '11', '9', '7', '8']

arr = arr.sort_by { |str| str.to_i }.reverse


# order the array of hashes based on year of publication, earliest to latest
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books.sort_by { |hash| hash[:published].to_i }


# for each collection, demonstrate how to reference the letter 'g'
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys[0]


# for each collection, how would you change 3 to 4
arr1 = [1, [2, 3], 4]
p arr1
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
p arr2
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
p hsh1
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
p hsh2
hsh2[['a']][:a][2] = 4
p hsh2


# determine the total age of only the male members
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

total_age = 0

munsters.each do |_, details|
  total_age += details["age"] if details["gender"] == 'male'
end

puts total_age


# print out name, age, and gender of each family member
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]}-year-old #{details["gender"]}."
end


# using each, output all the vowels from the strings
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = %w(a e i o u)

hsh.each_value do |arr|
  arr.each do |word|
    word.chars.each do |letter|
      puts letter if vowels.include?(letter)
    end
  end
end


# return new array of same structure with sub arrays ordered descendingly
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

p (arr.map { |sub| sub.sort { |a, b| b <=> a } })
  
# w/o modifying original, use map to return new array identical in structure 
# with each integer incremented by 1
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |hash| 
  new_hash = {}
  hash.each do |key, value| 
    new_hash[key] = value + 1
  end
  new_hash
end

p new_arr
p arr


# use a combination of methods including select or reject to return a new array 
# identical in structure containing only integers that are multiples of 3
arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select do |el|
    el % 3 == 0
  end
end

p arr
p new_arr


# w/o using to_h, return a hash where the key is the first item in each sub array
# and the value is the second item
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hash = arr.each_with_object({}) do |sub_arr, hsh|
  hsh[sub_arr[0]] = sub_arr[1]
end

p arr
p hash


# return new array containing same sub-arrays but ordered logically by only
# considering the odd numbers they contain
arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

new_arr = arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end

p arr
p new_arr


# return an array containing the colors of fruits and sizes of veggies. 
# sizes should be uppercase and colors should be capitalized
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

new_arr = hsh.each_with_object([]) do |(k, _), arr|
  if hsh[k][:type] == 'fruit'
    arr << hsh[k][:colors].map { |color| color.capitalize }
  else
    arr << hsh[k][:size].upcase
  end
end

p hsh
p new_arr


# return array containing only hashes where all integers are even
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

new_arr = arr.select do |hash|
  hash.all? do |_, value|
    value.all? do |num|
      num.even?
    end
  end
end

p arr
p new_arr
