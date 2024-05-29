

CONVERSION = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']

def integer_to_string(integer)
  string = ''
  loop do
    string.prepend(CONVERSION[integer % 10])
    integer /= 10
    break if integer == 0
  end
  string
end

def signed_integer_to_string(integer)
  integer_sign = integer <=> 0
  string_sign = case integer <=> 0
                when -1 then '-'
                when 1 then '+'
                else  ''
                end
  string_sign + integer_to_string(integer * integer_sign)
end



p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'


p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'
