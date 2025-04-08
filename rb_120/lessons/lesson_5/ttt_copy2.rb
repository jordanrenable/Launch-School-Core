require 'pry'

class Board
  WINNING_LINES = [%w(a1 a2 a3), %w(b1 b2 b3), %w(c1 c2 c3)] +
                      [%w(a1 b1 c1), %w(a2 b2 c2), %w(a3 b3 c3)] +
                      [%w(a1 b2 c3), %w(a3 b2 c1)]
  def initialize
    @squares = {}
    reset
  end
  
  def reset
    square_names = %w(a1 a2 a3 b1 b2 b3 c1 c2 c3)
    square_names.each { |key| @squares[key] = Square.new }
  end
  
  def get_square_at(key)
    @squares[key]
  end
  
  def set_square_at(key, marker)
    @squares[key].marker = marker
  end
  
  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end
  
  def full?
    unmarked_keys.empty?
  end
  
  def has_winner?
    !!winning_marker
  end
  
  def winning_marker
    WINNING_LINES.each do |line|
      if @squares.values_at(*line).all? { |v| v.marker == TTTGame::HUMAN_MARKER }
        return TTTGame::HUMAN_MARKER
      elsif @squares.values_at(*line).all? { |v| v.marker == TTTGame::COMPUTER_MARKER }
        return TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end
end

class Square
  attr_accessor :marker
  
  INITIAL_MARKER = ' '
  
  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end
  
  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end
  
  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  attr_reader :board, :human, :computer
  
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  
  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end
  
  def clear
    system 'clear'
  end
  
  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts
  end
  
  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe. Goodbye!"
    puts
  end
  
  def display_board
    puts "You are #{human.marker}. Computer is #{computer.marker}."
    puts
    puts "    1  |  2  |  3  "
    puts "       |     |     "
    puts "a   #{board.get_square_at('a1')}  |  #{board.get_square_at('a2')}  |  #{board.get_square_at('a3')}"
    puts "       |     |     "
    puts "  ----- ----- -----"
    puts "       |     |     "
    puts "b   #{board.get_square_at('b1')}  |  #{board.get_square_at('b2')}  |  #{board.get_square_at('b3')}"
    puts "       |     |     "
    puts "  ----- ----- -----"
    puts "       |     |     "
    puts "c   #{board.get_square_at('c1')}  |  #{board.get_square_at('c2')}  |  #{board.get_square_at('c3')}"
    puts "       |     |     "
    puts
  end
  
  def clear_screen_and_display_board
    clear
    display_board
  end
  
  def human_moves
    puts "Choose an empty square: #{board.unmarked_keys.join(', ')}"
    square = nil
    loop do
      square = gets.chomp
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid option."
    end
    board.set_square_at(square, human.marker)
  end
  
  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when human.marker
      puts"You won!"
    when computer.marker
      puts "Computer won."
    else
      puts "The board is full!"
    end
  end
  
  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, you must choose y or n."
    end
    answer == 'y'
  end
  
  def play
    clear
    display_welcome_message
    
    loop do
    display_board
    
      loop do
        human_moves
        break if board.full? || board.has_winner?
      
        computer_moves
        break if board.full? || board.has_winner?
        clear_screen_and_display_board
      end
      
      display_result
      break unless play_again?
      board.reset
      clear
      puts "Let's play again."
      puts
      sleep(1)
    end
  
    display_goodbye_message
  end
end

game = TTTGame.new

game.play