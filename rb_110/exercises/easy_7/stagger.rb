=begin
write a method that takes a string as an argument and returns a new string that
contains the original value using a staggered capitaliztion scheme in which 
every other character is capitalized, and the remaining are lowercase. non
letters should not be changed but count as characters when switching between
upper and lower case


return a new string means do not mutate!
take a string
iterate over each character
upcase even index characters
downcase odd index characters


def staggered_case(string)
  staggered = string.chars.map.with_index do |char, index|
    index.odd? ? char.downcase : char.upcase
  end
  staggered.join
end


def staggered_case(string, parity= 'even')
  staggered = string.chars.map.with_index do |char, index|
    if parity == 'even'
      index.even? ? char.upcase : char.downcase
    elsif parity == 'odd'
      index.odd? ? char.upcase : char.downcase
    end
  end
  staggered.join
end

def staggered_case(string, parity= 'even')
  mod = parity == 'even' ? 0 : 1
  staggered = string.chars.map.with_index do |char, index|
      (index + mod).even? ? char.upcase : char.downcase
  end
  staggered.join
end


pascal = "Pascal"

p staggered_case(pascal, 'odd')
p pascal

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'


MODIFY
iterate over each character
if the character is A-z, upcase it, then toggle case to downcase
if the next character is A-z, downcase it
if a character is not A-z, go to next iteration
=end


def staggered_case(string, upper= true, count_other= false)
  
  unless count_other
  
    staggered = string.chars.map do |char|
      if ('A'..'z').include?(char)
        upper ? char.upcase! : char.downcase!
        upper = !upper
      end
      char
    end
    
  else
    
    mod = upper ? 0 : 1
    staggered = string.chars.map.with_index do |char, index|
      (index + mod).even? ? char.upcase : char.downcase
    end
    
  end
  
 p staggered.join
end

pascal = "Pascal"

p staggered_case(pascal, false, true)
p pascal

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', true, false) == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS', true, false) == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers', true, false) == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case('I Love Launch School!', false, true) == "i lOvE LaUnCh sChOoL!"
p staggered_case('ALL CAPS', false, true) == "aLl cApS"
p staggered_case('ignore 77 the 444 numbers', false, true) == "iGnOrE 77 tHe 444 nUmBeRs"