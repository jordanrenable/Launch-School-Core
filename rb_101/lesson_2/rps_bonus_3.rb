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

  abbreviated_choices = { r: 'rock',
                          p: 'paper',
                          s: 'scissors',
                          l: 'lizard',
                          sp: 'spock' }

  player_wins = 0
  computer_wins = 0

  until player_wins == 3 || computer_wins == 3

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

    choice = abbreviated_choices[choice.to_sym]
    computer_choice = CHOICES.sample

    prompt("You chose #{choice}; Computer chose #{computer_choice}")

    if winning_combos[choice.to_sym].include?(computer_choice)
      prompt("You won!")
      player_wins += 1
    elsif winning_combos[computer_choice.to_sym].include?(choice)
      prompt("Computer won!")
      computer_wins += 1
    else
      prompt("It's a tie!")
    end

    prompt("Score: You- #{player_wins} Computer- #{computer_wins}")
  end

  if player_wins == 3
    prompt("You are the grand winner!")
  else
    prompt("Computer is the grand winner!")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing. Goodbye!")
