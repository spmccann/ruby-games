# frozen_string_literal: true

require_relative 'letters'
require_relative 'player'

hangman = Letters.new
p1 = Player.new
game_loop = true
hangman.load_game if p1.loads

p1.start_game
while game_loop
  hangman.letter_check(p1.player_guess)
  p1.play_again if hangman.winner_check
  p1.play_again if hangman.game_over
  hangman.save_game if p1.saves
end
