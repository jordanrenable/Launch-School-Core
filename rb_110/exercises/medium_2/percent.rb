=begin
write a method that takes a string and returns a hash containing 3 keys: the
percentage of lowercase chars, the percentage of uppercase chars, and the 
percentage of chars that are neither


def letter_percentages(string)
  hash = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

  hash.transform_values do |regex|
    (string.count(regex) * 100.0 / string.size).round(1)
  end
end

=end
def letter_percentages(string)
  percentages = { }
  lower, upper, neither = 0.0, 0.0, 0.0
  string.each_char do |char|
    case char
    when ('A'..'Z') then upper += 1
    when ('a'..'z') then lower += 1
    else                 neither += 1
    end
  end
  percentages[:uppercase] = ((upper / string.size) * 100).round(1)
  percentages[:lowercase] = ((lower / string.size) * 100).round(1)
  percentages[:neither] = ((neither / string.size) * 100).round(1)
  p percentages
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')