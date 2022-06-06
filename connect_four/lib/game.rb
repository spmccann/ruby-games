# frozen_string_literal: true

require_relative './moves'
require_relative './messages'

messages = Messages.new
moves = Moves.new

messages.title
messages.player_names
moves.display

game_loop = true
turn = true

while game_loop
  messages.make_move(turn)
  moves.movement
  until moves.validation(turn)
    messages.invalid_move
    moves.movement
  end
  moves.display
  turn = !turn
end
