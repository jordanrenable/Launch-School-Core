=begin
take an array of strings
return an array the same number of elements but with the vowels removed from
each element


=end

def remove_vowels(array)
  array.map do |string|
    string.delete("AEIOUaeiou")
  end
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']