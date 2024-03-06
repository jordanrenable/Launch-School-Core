def center_of(string)
  index = string.size / 2
  string.size.odd? ? string[index] : string[index - 1, 2]
end

puts center_of('I love ruby')
puts center_of('Launch School') == ' '
puts center_of("Launch") == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
