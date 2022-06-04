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
    puts 'please enter the name for player 1:'
    @player1 = gets.chomp
    puts 'Please enter the name for player 2:'
    @player2 = gets.chomp
  end

  def make_move(turn)
    if turn
      puts "#{player1}, it's your turn to move"
    else
      puts "#{player2}, it's your turn to move"
    end
  end
end
