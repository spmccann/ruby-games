# frozen_string_literal: true

require_relative './moves'
require_relative './messages'

messages = Messages.new
moves = Moves.new

messages.title
messages.player_names

game_loop = true
turn = true

while game_loop
  moves.display_board
  messages.make_move(turn)
  moves.validate_move
  moves.display_board
  turn = !turn
end
