def palindrome?(input)
  input == input.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false
puts palindrome?("madam i'm adam") == false
puts palindrome?('356653') == true

puts palindrome?('bob')
puts palindrome?('racecar')

array1 = [1, 2, 3, 2, 1]
array2 = ['hello', 'goodbye', 'hello']
array3 = [7, 4, 11, 72] # not a palindrome

puts palindrome?(array1)
puts palindrome?(array2)
puts palindrome?(array3) # is false
puts palindrome?([1, 5, 1])

def real_palindrome?(input)
  input = input.downcase.delete('^0-9a-z')
  input == input.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true
puts real_palindrome?("Madam, I'm Adam") == true
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
