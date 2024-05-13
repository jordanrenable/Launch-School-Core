

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def joinor(arr, punc= ', ', word= 'or')
  output = ''
  case arr.size
  when 0 then ''
  when 1 then output = "#{arr[0]}"
  when 2 then output = "#{arr[0]} #{word} #{arr[1]}"
  else
    arr.each_with_index do |el, ind|
      output << "#{el}"
      if (ind + 2) == arr.size
        output << "#{punc}#{word} "
      elsif (ind + 1) < arr.size
        output << "#{punc}" 
      end
    end
  end
  output
end

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You are 'X'. Computer is 'O'."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "That is not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_squares(brd, marker)
  temp_arrs = WINNING_LINES.select do |line|
    brd.values_at(*line).count(INITIAL_MARKER) == 1 &&
    brd.values_at(*line).count(marker) == 2
  end
  
  if temp_arrs.empty?
    nil
  else
    (temp_arrs.map do |subarr|
      subarr.select do |space|
        brd[space] == INITIAL_MARKER
        end
      end).sample[0]
  end
end
  
def computer_places_piece!(brd)
  square = if find_at_risk_squares(brd, COMPUTER_MARKER)
              find_at_risk_squares(brd, COMPUTER_MARKER)
           elsif find_at_risk_squares(brd, PLAYER_MARKER)
                 find_at_risk_squares(brd, PLAYER_MARKER)
           elsif empty_squares(brd).include?(5)
                 5
           else
              empty_squares(brd).sample
           end
  
  brd[square] = COMPUTER_MARKER
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == brd[line[1]] &&
       brd[line[1]] == brd[line[2]]
      if brd[line[0]] == PLAYER_MARKER
        return 'Player'
      elsif brd[line[0]] == COMPUTER_MARKER
        return 'Computer'
      end
    end
  end
  nil
end

def board_full?(brd)
  empty_squares(brd).empty?
end

loop do
  player_wins = 0
  computer_wins = 0

  loop do
    board = initialize_board
  
    loop do
      display_board(board)
      
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end
    
    display_board(board)
  
    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      sleep(1)
    else
      prompt "It's a tie!"
      sleep(1)
    end
    
    if detect_winner(board) == 'Player'
      player_wins += 1
    elsif detect_winner(board) == 'Computer'
      computer_wins += 1
    end
    
    prompt "Player Wins: #{player_wins}  Computer Wins: #{computer_wins}"
    sleep(1)
    
    if player_wins < 3 && computer_wins < 3
      prompt "Next round!"  
      sleep(2)
    else
      prompt "#{detect_winner(board)} is the grand champ!"
      sleep(2)
    end
    
    break if player_wins == 3 || computer_wins == 3
  end
  
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  
end

prompt "Thanks for playing Tic Tac Toe. Goodbye!"
