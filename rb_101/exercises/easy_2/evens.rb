(2..98).each { |n| puts n if n.even? }

counter = 2
while counter <= 98
  puts counter
  counter += 2
end

2.upto(98) { |n| puts n if n.even? }
