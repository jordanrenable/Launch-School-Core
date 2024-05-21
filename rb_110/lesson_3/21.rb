SUITS = %w(Clubs Diamonds Hearts Spades)
VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
WINNING_NUMBER = 21
DEALER_STAYS = 17

def prompt(msg)
  puts "=> #{msg}"
end

def welcome
  puts ''
  prompt "Let's play 21! Hopefully you know the rules..."
  sleep(3)
end

def initialize_deck
  deck = []
  SUITS.each do |suit|
    VALUES.each do |value|
      deck << [value, suit]
    end
  end
  deck
end

def deal_cards!(deck, player_hand, dealer_hand)
  system 'clear'
  puts ''
  prompt "Dealing..."
  2.times do
    player_hand << deck.shift
    dealer_hand << deck.shift
  end
  sleep(1)
end

def display_hands(player_hand, dealer_hand)
  puts ''
  prompt "The dealer is showing "
  dealer_hand.each { |card| prompt card.join(' of ').to_s }
  puts ''
  prompt "Your cards are "
  player_hand.each { |card| prompt card.join(' of ').to_s }
  puts ''
end

def display_totals(player_hand, dealer_hand)
  puts ''
  prompt "The dealer is showing a total of #{calc_total(dealer_hand)}\n "
  prompt "Your current total is #{calc_total(player_hand)}\n "
end

def display_hands_and_totals(player_hand, dealer_hand)
  system 'clear'
  display_hands(player_hand, dealer_hand)
  sleep(2)
  display_totals(player_hand, dealer_hand)
  sleep(1)
end

def busted?(hand)
  calc_total(hand) > WINNING_NUMBER
end

def hit!(hand, deck)
  hand << deck.shift
end

def calc_total(hand)
  total = 0
  aces = 0
  hand.each do |card|
    if card[0] == 'A'
      aces += 1
      total += 11
    elsif card[0].to_i == 0
      total += 10
    else
      total += card[0].to_i
    end
  end
  total = adjust_ace_value(total, aces)
end

def adjust_ace_value(total, aces)
  if total > WINNING_NUMBER && aces > 1
    total -= ((aces - 1) * 10)
    if total > WINNING_NUMBER
      total -= 10
    end
  elsif total > WINNING_NUMBER && aces == 1
    total -= 10
  end

  total
end

def twentyone?(total)
  total == WINNING_NUMBER
end

def blackjack?(player_hand, dealer_hand)
  if twentyone?(calc_total(player_hand)) && twentyone?(calc_total(dealer_hand))
    prompt "You and the dealer both have blackjack! It's a push."
    true
  elsif twentyone?(calc_total(player_hand))
    prompt "You have blackjack! You win!"
    true
  elsif twentyone?(calc_total(dealer_hand))
    prompt "The dealer has blackjack! You lose."
    true
  else
    false
  end
end

def player_turn(player_hand, dealer_hand, deck)
  play = nil
  loop do
    puts ''
    prompt "Would you like to hit or stay? (hit/stay)\n "
    play = gets.chomp.downcase

    if play == 'hit'
      hit!(player_hand, deck)
      prompt "You chose to hit.\n "
      system 'clear'
      display_hands_and_totals(player_hand, [dealer_hand[0]])
      break
    elsif play == 'stay'
      prompt "You chose to stay.\n "
      break
    else
      prompt "That is not a valid choice\n "
    end
  end
  play
end

def dealer_turn(dealer_hand, deck)
  until calc_total(dealer_hand) >= DEALER_STAYS
    hit!(dealer_hand, deck)
    puts ''
    prompt "The dealer hits."
    sleep(1)
  end
end

def declare_winner(player_hand, dealer_hand)
  case calc_total(player_hand) <=> calc_total(dealer_hand)
  when 1 then prompt "You win!"
  when 0 then prompt "It's a push."
  when -1 then prompt "You lose."
  end
end

system 'clear'

welcome

player_chips = 0

loop do
  player_hand = []
  dealer_hand = []
  deck = nil

  loop do
    deck = initialize_deck.shuffle

    deal_cards!(deck, player_hand, dealer_hand)

    display_hands_and_totals(player_hand, [dealer_hand[0]])

    if blackjack?(player_hand, dealer_hand)
      player_chips += (calc_total(player_hand) <=> calc_total(dealer_hand))
      break
    end

    loop do
      if busted?(player_hand)
        prompt "You have busted! You lose.\n "
        player_chips -= 1
        break
      elsif twentyone?(calc_total(player_hand))
        prompt "You hit #{WINNING_NUMBER}!\n "
        break
      elsif player_turn(player_hand, dealer_hand, deck) == 'stay'
        break
      end
    end

    break if busted?(player_hand)

    prompt "It is now the dealer's turn.\n "
    sleep(2)

    dealer_turn(dealer_hand, deck)

    display_hands_and_totals(player_hand, dealer_hand)

    if busted?(dealer_hand)
      prompt "The dealer has busted! You win!"
      player_chips += 1
    else
      declare_winner(player_hand, dealer_hand)
      player_chips += (calc_total(player_hand) <=> calc_total(dealer_hand))
    end

    break
  end

  prompt "You have #{player_chips} chips."
  if player_chips == 5
    prompt "You beat the house, and are no longer welcome in the casino!"
    break
  elsif player_chips == -5
    prompt "You owe the house and are being removed from the casino!"
    break
  end
  
  prompt "Would you like to play another hand? (y/n)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt "Thanks for playing #{WINNING_NUMBER}!"

sleep(3)
system 'clear'
