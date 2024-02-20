require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def integer?(number)
  Integer(number) rescue false
end

def float?(number)
  Float(number) rescue false  
end

def valid_number?(number)
  float?(number) || integer?(number)
end

num1 = ''
num2 = ''
operator = ''
result = ''

prompt(MESSAGES['welcome'])

loop do
  loop do
    prompt(MESSAGES['first'])
    num1 = gets.chomp

    if valid_number?(num1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  loop do
    prompt(MESSAGES['second'])
    num2 = gets.chomp

    if valid_number?(num2)
     break
    else
     prompt(MESSAGES['invalid_number'])
    end
  end

  #operator_prompt = <<-MSG
  #  What operation would you like to perform?
 #   1) add
 #   2) subtract
 #   3) multiply
 #   4) divide
 # MSG

  prompt(MESSAGES['operator_prompt'])

  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['invalid_operator'])
    end
  end

  result = case operator
           when '1'
             num1.to_f + num2.to_f
           when '2'
             num1.to_f - num2.to_f
           when '3'
             num1.to_f * num2.to_f
           when '4'
             num1.to_f / num2.to_f
           end

  prompt(MESSAGES['result'] + "#{result}")

  prompt(MESSAGES['again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])
