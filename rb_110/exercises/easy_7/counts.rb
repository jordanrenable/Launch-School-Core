=begin
write a method that counts the number of occurrences of each element in a given
array

take an array
create an empty hash
iterate over the array
for each word, check to see if it exists in the hash already
if it already exists in the hash, increment its value by 1
if it does not exist in the hash, set it to equal 1
return the hash
=end

def count_occurrences(array)
  counts = {}
  array.each do |item|
    if counts.include?(item.downcase)
      counts[item.downcase] += 1
    else
      counts[item.downcase] = 1
    end
  end
  counts.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck', 'suv', 
  'TRUCK', 'CaR'
]

count_occurrences(vehicles)