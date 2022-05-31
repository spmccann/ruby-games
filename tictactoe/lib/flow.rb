# frozen_string_literal: true

# messages to players to create flow of game
class GameFlowMessages
  attr_accessor(:names, :x, :o)

  def initialize
    @x = ''
    @o = ''
  end

  def start_game
    puts "2-Player Tic Tac Toe\nNew Game? (yes/no)"
    gets.downcase.chomp == 'yes'
  end

  def players
    puts 'Please enter the name for player X:'
    @x = gets.chomp
    puts 'Please enter the name for player O: '
    @o = gets.chomp
  end

  def greet
    puts "\nHello, #{@x} and #{@o}!"
    puts 'You can make your moves by entering the corresponding square number.'
  end

  def make_move(player)
    if player == @x
      puts "#{@x}, mark a square for 'X' (0-8): "
    else
      puts "#{@o}, mark a square for 'O' (0-8):  "
    end
    validate_move
  end

  def invalid
    puts 'Invalid move, try again'
  end

  def tie
    puts "It's a tie"
  end

  def winner(turn)
    if turn
      puts "#{@o} is the winner!"
    else
      puts "#{@x} is the winner!"
    end
  end

  def validate_move
    move = gets.chomp
    if /\d/.match(move) && move.to_i.between?(0, 8)
      move.to_i
    else
      invalid
      validate_move
    end
  end
end
