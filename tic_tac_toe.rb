board = { 1 => " ", 2 => " ", 3 => " ", 4 => " ", 5 => " ", 6 => " ", 7 => " ", 8 => " ", 9 => " "}
WINNING_COMBINATIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
winner = nil

def display_board(board)
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |     "
end

def has_won?(player, board)
  arr = board.select { |k, v| v == player }.keys
  permutations = arr.permutation(3).to_a
  permutations.each { |x| return "yes" if WINNING_COMBINATIONS.include?(x) }
end

loop do

  display_board(board)

  puts "Choose a position (from 1 to 9) to place a piece:"
  player_choice = gets.chomp

  until board.select { |k, v| v == " " }.keys.include?(player_choice.to_i)
    puts "Please enter a valid position (from 1 to 9, that hasn't already been selected):"
    player_choice = gets.chomp
  end

  board[player_choice.to_i] = "X"

  if has_won?("X", board) == "yes"
    display_board(board)
    puts "Player has won!"
    break
  end

  unless board.values.include?(" ")
    display_board(board)
    puts "It's a tie!"
    break
  end

  computer_choice = board.select { |k, v| v == " " }.keys.sample
  board[computer_choice] = "O"

  if has_won?("O", board) == "yes"
    display_board(board)
    puts "Computer has won!"
    break
  end

end

