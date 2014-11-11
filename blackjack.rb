def initialize_suit(s)
  suit = {}
  suit["Ace of #{s}"] = 1
  (2..10).each { |x| suit["#{x} of #{s}"] = x }
  suit["Jack of #{s}"] = 10
  suit["Queen of #{s}"] = 10
  suit["King of #{s}"] = 10
  suit
end

def initialize_deck
  deck = {}
  ["Clubs", "Diamonds", "Hearts", "Spades"].each { |s| deck.merge!(initialize_suit(s)) }
  deck
end

def deal_card(d)
  card = d.keys.sample
  card_with_value = {card => d[card]}
  d.delete(card)
  card_with_value
end

def calculate_total(hand)
  total = 0
  hand.values.each { |v| total += v}
  if hand.values.include?(1) && (total + 10 <= 21)
    total += 10
  end
  total
end


puts "Welcome to Blackjack!"
puts "What is your name?"
player_name = gets.chomp
puts "Good luck #{player_name}! Let's start."

deck = initialize_deck

player_hand = {}
dealer_hand = {}

2.times do
  player_hand.merge!(deal_card(deck))
  dealer_hand.merge!(deal_card(deck))
end

puts "You have been dealt: #{player_hand.keys[0]}, #{player_hand.keys[1]}"
puts "Dealer has been dealt: #{dealer_hand.keys[0]}, #{dealer_hand.keys[1]}"

if calculate_total(player_hand) == 21
  puts "Congratulations, you have blackjack! #{player_name} wins!"
  exit
elsif calculate_total(dealer_hand) == 21
  puts "Dealer has blackjack! Dealer wins!"
  exit
else
  puts "Your total is #{calculate_total(player_hand)}."
  puts "Dealer's total is #{calculate_total(dealer_hand)}."
end

begin
  puts "Would you like to hit (h) or stay (s)?"
  player_choice = gets.chomp.downcase

  until ["h", "s"].include?(player_choice)
    puts "Please enter a valid choice (h for hit or s for stay):"
    player_choice = gets.chomp.downcase
  end

  case player_choice
  when "s"
    puts "You have chosen to stay with a total of #{calculate_total(player_hand)}. Dealer will now play."
  when "h"
    puts "You have chosen to hit."
    player_hand.merge!(deal_card(deck))
    puts "You have been dealt: #{player_hand.keys.last}."
    puts "Your total is now #{calculate_total(player_hand)}."
    if calculate_total(player_hand) > 21
      puts "You are bust! Dealer wins!"
      exit
    end
  end
end until player_choice == "s"

while calculate_total(dealer_hand) < 17
  dealer_hand.merge!(deal_card(deck))
  puts "Dealer has been dealt: #{dealer_hand.keys.last}."
  puts "Dealer's total is now #{calculate_total(dealer_hand)}."
  if calculate_total(dealer_hand) > 21
    puts "Dealer is bust! #{player_name} wins!"
    exit
  end
end

puts "Your total is #{calculate_total(player_hand)} and dealer's total is #{calculate_total(dealer_hand)}."

if calculate_total(player_hand) > calculate_total(dealer_hand)
  puts "#{player_name} wins!"
elsif calculate_total(player_hand) < calculate_total(dealer_hand)
  puts "Dealer wins!"
else
  puts "It's a tie!"
end







