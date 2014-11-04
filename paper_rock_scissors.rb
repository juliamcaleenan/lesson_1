OPTIONS = { "p" => "paper", "r" => "rock", "s" => "scissors" }
play_again = "y"

puts "Play Paper Rock Scissors!"

while play_again == "y"

  puts "Choose paper (P), rock (R) or scissors (S):"
  user_input = gets.chomp.downcase

  until OPTIONS.keys.include?(user_input)
    puts "Please enter a valid input (P, R, S):"
    user_input = gets.chomp.downcase
  end

  computer_input = OPTIONS.keys[rand(3)]

  puts "You picked #{OPTIONS[user_input]} and the computer picked #{OPTIONS[computer_input]}."

  case
    when user_input == computer_input
      puts "It's a tie."
    when user_input == "p" && computer_input == "r"
      puts "Paper wraps rock."
      puts "You won!"
    when user_input == "r" && computer_input == "p"
      puts "Paper wraps rock."
      puts "Computer won!"
    when user_input == "p" && computer_input == "s"
      puts "Scissors cut paper."
      puts "Computer won!"
    when user_input == "s" && computer_input == "p"
      puts "Scissors cut paper."
      puts "You won!"
    when user_input == "r" && computer_input == "s"
      puts "Rock bashes scissors."
      puts "You won!"
    when user_input == "s" && computer_input == "r"
      puts "Rock bashes scissors."
      puts "Computer won!"
  end

  puts "Would you like to play again? (Y/N)"
  play_again = gets.chomp.downcase

end



