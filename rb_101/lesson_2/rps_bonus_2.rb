CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
VALID_INPUTS = ['r', 'p', 's', 'l', 'sp']

def prompt(message)
  puts("=> #{message}")
end

loop do
  choice = ''

  winning_combos = { rock: ['scissors', 'lizard'],
                     paper: ['rock', 'spock'],
                     scissors: ['lizard', 'paper'],
                     lizard: ['paper', 'spock'],
                     spock: ['rock', 'scissors'] }

  loop do
    prompt(<<~MSG
      Choose one: #{CHOICES.join(', ')}.
      'r' for 'rock'
      'p' for 'paper'
      's' for 'scissors'
      'l' for 'lizard'
      'sp' for 'spock'
      MSG
          )

    choice = gets.chomp

    if VALID_INPUTS.include?(choice)
      break
    else
      prompt("That doesn't look like a valid choice.")
    end
  end

  choice =
    case choice
    when 'r' then 'rock'
    when 'p' then 'paper'
    when 's' then 'scissors'
    when 'l' then 'lizard'
    when 'sp' then 'spock'
    end

  computer_choice = CHOICES.sample

  prompt("You chose #{choice}; Computer chose #{computer_choice}")

  if winning_combos[choice.to_sym].include?(computer_choice)
    prompt("You won!")
  elsif winning_combos[computer_choice.to_sym].include?(choice)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing. Goodbye!")
