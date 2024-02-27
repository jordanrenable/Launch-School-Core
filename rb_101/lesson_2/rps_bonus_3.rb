CHOICES = %w(rock paper scissors lizard spock)
VALID_INPUTS = %w(r p s l sp)
WINNING_COMBOS = { 'rock' => %w(scissors lizard),
                   'paper' => %w(rock spock),
                   'scissors' => %w(lizard paper),
                   'lizard' => %w(paper spock),
                   'spock' => %w(rock scissors) }

def prompt(message)
  puts("=> #{message}")
end

def win?(first, second)
  WINNING_COMBOS[first].include?(second)
end

def winner(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It's a tie!"
  end
end

prompt(<<~RULES
      Let's play Rock, Paper, Scissors, Lizard, Spock!
      Scissors cut Paper
      Paper covers Rock
      Rock crushes Lizard
      Lizard poisons Spock
      Spock smashes Scissors
      Scissors decapitate Lizard
      Lizard eats Paper
      Paper disproves Spock
      Spock vaporizes Rock
      and as it always has been
      Rock crushes Scissors
      RULES
      )

loop do
  choice = ''

  abbreviated_choices = { 'r' => 'rock',
                          'p' => 'paper',
                          's' => 'scissors',
                          'l' => 'lizard',
                          'sp' => 'spock' }

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

      choice = gets.chomp.downcase

      if VALID_INPUTS.include?(choice)
        break
      else
        prompt("That doesn't look like a valid choice.")
      end
    end

    choice = abbreviated_choices[choice]
    computer_choice = CHOICES.sample

    prompt("You chose #{choice}; Computer chose #{computer_choice}")

    prompt(winner(choice, computer_choice))

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
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
