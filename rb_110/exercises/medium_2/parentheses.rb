=begin
write a method that takes a string as an argument and returns true if all () in
the string are properly balanced, false if not. 

must occur in matching pairs- same number of both ( and )
no pair can start with ), must start with (


strip out everything that isn't ()

( () () )
()

( ( () ) () )
( () )
()

( () ) ()
()

if ) false
if ( look at next
  if ) it's a pair
  if ( look at next
    if ) it's a pair
    if ( look at next

push onto stack
if -2 == ( && -1 == )
clear -1..-2

stack.empty? ? true : false


def balanced?(string, char1, char2)
  chars = string.chars.select { |char| (char1 + char2).include?(char) }
  stack = []
  until chars.empty?
    stack << chars.shift
    if stack[-2] == char1 && stack[-1] == char2
      stack.pop(2)
    end
  end
  stack.empty?
end

def balanced?(string, pair)
  characters = string.chars.select { |char| pair.include?(char) }
  stack = ''
  until characters.empty?
    stack << characters.shift
    if stack[-2..-1] == pair
      stack[-2..-1] = ''
    end
  end
  stack.empty?
end

=end
def balanced?(string, pair)
  just_chars = string.delete("^#{pair}")

  loop do
    just_chars.include?(pair) ? just_chars.gsub!(pair, '') : break
  end 

  just_chars.empty?
end

p balanced?('What (is) this?', '()') == true
p balanced?('What is" this?', '""') == false
p balanced?('What is] this?', '[]') == false
p balanced?('((What) (is this))?', '()') == true
p balanced?('((What)) (is this))?', '()') == false
p balanced?('Hey!', '{}') == true
p balanced?('}Hey!{', '{}') == false
p balanced?('What {(is)}) up(', '()') == false
p balanced?('What ())(is() up', '()') == false