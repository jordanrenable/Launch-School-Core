def short_long_short(str1, str2)
  str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

puts short_long_short('banga', 'rang')

=begin

def short_long_short(str1, str2)
  if str1.size > str2.size
    long = str1
    short = str2
  else
    long = str2
    short = str1
  end
  short + long + short
end

=end
