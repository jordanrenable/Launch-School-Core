class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end
  
  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end
  
  def lizard?
    @value =='lizard'
  end
  
  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.paper? || other_move.spock?)) ||
      (spock? && (other_move.rock? || other_move.scissors?))
  end
end

class Score
  attr_reader :points
  
  def initialize
    @points = 0
  end
  
  def to_s
    @points.to_s
  end
  
  def increment_points
    @points += 1
  end
  
  def has_5_points?
    self.points == 5
  end
end

class Player
  attr_accessor :move, :name, :score, :move_history

  def initialize
    set_name
    self.score = Score.new
    @move_history = []
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      puts
      break unless n.empty?
      puts "Sorry, you must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock."
      choice = gets.chomp
      puts
      break if Move::VALUES.include? choice
      puts "Sorry, that is an invalid choice."
    end
    self.move = Move.new(choice)
    self.move_history << self.move.value
  end
end

class Computer < Player
  attr_reader :move_options
  
  COMPUTER_MOVE_OPTIONS = { 'R2D2' => ['rock'] ,
                            'C3P0' => Move::VALUES,
                            'Hal' => ['scissors', 'scissors', 'scissors', 'rock'],
                            'Sonny' => ['spock', 'spock', 'rock', 'lizard', 'scissors']
  }
  def set_name
    self.name = ['R2D2', 'C3P0', 'Hal', 'Sonny'].sample
    @move_options = COMPUTER_MOVE_OPTIONS[self.name]
  end
  
  def choose
    self.move = Move.new(self.move_options.sample)
    self.move_history << self.move.value
  end
end

class RPSGame
  attr_accessor :human, :computer

  RULES = <<~RULES
      These are the rules:
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
      
  def initialize
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
    display_rules
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock."
    puts
  end
  
  def display_rules
    puts RULES
    puts "We will play to 5 points."
    puts
  end
  
  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end
  
  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score.increment_points
    elsif computer.move > human.move
      puts "#{computer.name} won."
      computer.score.increment_points
    else
      puts "It's a tie."
    end
    puts
  end
  
  def display_scores
    puts "#{human.name} has #{human.score} points."
    puts "#{computer.name} has #{computer.score} points."
    puts
  end
  
  def game_over
    human.score.has_5_points? || computer.score.has_5_points?
  end
  
  def display_grand_winner
    winner = human.score.has_5_points? ? human.name : computer.name
    puts "#{winner} is the grand winner!"
    puts
  end
  
  def display_move_history
    puts "#{human.name} played #{human.move_history}"
    puts "#{computer.name} played #{computer.move_history}"
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must choose y or n."
    end
    answer == 'y'
  end

  def play
    until game_over
      human.choose
      computer.choose
      display_moves
      sleep(2)
      display_winner
      display_scores
      sleep(3)
      system 'clear'
    end
    display_move_history
    display_grand_winner
    sleep(3)
    play_again?
    display_goodbye_message
  end
end

RPSGame.new.play