# frozen_string_literal: true

# messages to the players
class Messages
  attr_accessor(:player1, :player2)

  def initialize
    @player1 = ''
    @player2 = ''
  end

  def title
    puts 'Connect Four'
  end

  def player_names
    puts 'Player 1, enter your name:'
    @player1 = gets.chomp
    puts 'Player 2, enter your name:'
    @player2 = gets.chomp
  end

  def make_move(turn)
    player = turn ? @player1 : @player2
    puts "#{player}, it's your turn to move"
  end

  def invalid_move
    puts 'Invalid move. Please try again'
  end
end
