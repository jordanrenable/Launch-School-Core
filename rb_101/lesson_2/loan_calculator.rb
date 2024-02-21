# loan calculator

def integer?(number)
  Integer(number) rescue false
end

def float?(number)
  Float(number) rescue false  
end

def valid_number?(number)
  (float?(number) || integer?(number)) && number.to_f > 0
end

puts '=>Welcome to the loan calculator'
loan_amount = ''
duration_in_years = ''
apr = ''

loop do
  loop do
    puts '=>Please input the loan amount'
    loan_amount = gets.chomp
    loan_amount = loan_amount.delete(',')
  
    if valid_number?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      puts "=>That doesn't look like a valid amount."
    end
  end

  loop do
    puts '=>Please input the loan duration in years'
    duration_in_years = gets.chomp
  
    if valid_number?(duration_in_years)
      duration_in_years = duration_in_years.to_f
      break
    else
      puts "=>That doesn't look like a valid number."
    end
  end

  loop do
    puts '=>Please input the Annual Percentage Rate (APR)'
    apr = gets.chomp
    apr = apr.delete('%')

    if valid_number?(apr)
      apr = apr.to_f
     break
    else
      puts "=>That doesn't look like a valid number."
    end
  end

  apr = (apr / 100) if apr >= 0.25

  duration_in_months = duration_in_years * 12
  monthly_interest = apr / 12

  puts '=>Calculating...'

  monthly_payment = loan_amount * 
                  (monthly_interest / 
                  (1 - (1 + monthly_interest)**(-(duration_in_months))))

  puts "=>Your monthly payment will be #{monthly_payment}"
  
  puts "=> Would you like to make another calculation? Y to calculate"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

puts "Thank you for using the loan calculator."
puts "Goodbye!"