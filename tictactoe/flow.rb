# frozen_string_literal: true

# messages to players to create flow of game
class GameFlowMessages
  attr_accessor(:names)

  def start_game
    puts "2-Player Tic Tac Toe\nNew Game? (yes/no)"
    gets.downcase.chomp == 'yes'
  end

  def player_names
    puts 'Please enter the names for player one and player two (John Jane): '
    @names = gets.chomp.split
    puts "\nHello, #{@names[0]} and #{@names[1]}!"
    puts 'You can make your moves by entering the corresponding square number.'
  end

  def make_move(turn)
    if turn == 'x'
      puts "#{names[0]}, mark a square for 'X' (0-8): "
    else
      puts "#{names[1]}, mark a square for 'O' (0-8):  "
    end
    gets.chomp.to_i
  end

  def winner(player)
    if player == 'x'
      puts "#{names[0]} is the winner!"
    else
      puts "#{names[1]} is the winner!"
    end
  end
end
