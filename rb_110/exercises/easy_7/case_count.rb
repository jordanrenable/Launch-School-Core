=begin
write a method that takes a string and returns a hash that contains 3 entries-
one represents the number of lowercase characters, one the number of uppercase
characters, and one the number of characters that are neither

take a string
create a hash with 3 keys- lowercase, uppercase, neither- and set their values 
to 0
iterate over each character in the the string
for whichever category the character belongs, increment that keys value by 1

create arrays of the uppercase values and lowercase values- cross compare if the
array contains the character in the string

once each character is accounted for, return the hash

def letter_case_count(string)
  {
    lowercase: string.count('a-z'),
    uppercase: string.count('A-Z'),
    neither: string.count('^A-z')
  }
end

=end

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  string.each_char do |char|
    if ('a'..'z').include?(char)
      counts[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }