# frozen_string_literal: true

# player actions
class Player
  def player_guess
    puts 'Please guess a letter:'
    gets.downcase.chomp
  end

  def play_again
    puts 'Would you like to try again? (yes or no)'
    start_game if gets.chomp.downcase == 'yes' || abort
  end

  def start_game
    puts "--------------------\nHangman"
  end

  def saves
    puts 'Would you like to save the game? (yes or no)'
    gets.downcase.chomp == 'yes'
  end

  def loads
    if File.exist?('saves/my_game.txt')
      puts 'Do you want to load your game? (yes or no)'
      gets.downcase.chomp == 'yes'
    end
  end
end
