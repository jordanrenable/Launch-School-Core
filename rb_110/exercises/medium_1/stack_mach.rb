=begin
write a method that implements a mini stack and register based programming
language that has the following commands

n - place a value in the register. do not modify the stack
PUSH - push the register value on to the stack. leave the value in the register
ADD - pops a value from the stack and adds it to the register value, storing the
  result in the register
SUB - pops a value from the stack and subtracts it from the register, storing 
  the result in the register
MULT - pops a value from the stack and multiplies it by the register, storing
  the result in the register
DIV - pops a value from the stack and divides it into the register value, 
  storing the integer result in the register
MOD - pops a value from the stack and divides it into the register value, stor-
  ing the integer remainder of the division in the register
POP - remove the topmost item from the stack and place it in the register
PRINT - print the register value

programs will be supplied via a string argument.

initialize the register to 0

save the instructions as a separated array
iterate over each instruction
if the instruction is an integer, reassign the register to its value
if the instruction is one of the others, do as described

VALID_COMMANDS = ['push', 'pop', 'add', 'sub', 'mult', 'div', 'mod', 'print']
STACK_COMMANDS = ['pop', 'add', 'sub', 'mult', 'div', 'mod']

def valid_command?(command, stack)
  if (stack.empty? && STACK_COMMANDS.include?(command)) ||
       (VALID_COMMANDS.include?(command) || command.match?(/[0-9]/)) == false
    return false
  end

  true
end


=end

def minilang(commands)
  register = 0
  stack = []
  commands.split.each do |command|
    case command
    when 'PUSH' then stack << register
    when 'ADD' then register += stack.pop
    when 'SUB' then register -= stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    when is_integer_string?(command) then register = command.to_i
    else puts "Invalid token: #{command}"
    end
    puts "Stack empty" if stack.empty?
  end
  nil
end

def is_integer_string?(string)
  if string.to_i.integer? && string.to_i.to_s == string
    string
  end
end


minilang('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT')

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
