def stringy(integer, switch = 1)
  string = ''
  if switch == 0
    1.step(to: integer, by: 1) do |n|
      n.odd? ? (string << '0') : (string << '1')
    end
  else
    1.step(to: integer, by: 1) do |n|
      n.odd? ? (string << '1') : (string << '0')
    end
  end
  string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts stringy(7, 0)

puts stringy(1)
puts stringy(1, 0)
