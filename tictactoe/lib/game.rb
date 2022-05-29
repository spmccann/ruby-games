# frozen_string_literal: true

require './board'
require './flow'

board = Board.new
flow = GameFlowMessages.new

flow.start_game ? game_status = true : abort
flow.players
flow.greet
board.example_display
board.reset_board
turn = true

while game_status
  if board.game_win?
    board.reset_board
    flow.winner(turn)
    flow.start_game ? board.display : game_status = false
  elsif board.game_tie?
    board.reset_board
    flow.tie
    flow.start_game ? board.display : game_status = false
  else
    choice = turn ? flow.make_move(flow.x) : flow.make_move(flow.o)
    if board.open_square(choice)
      board.placement(choice, turn)
      board.display
      turn = !turn
    else
      flow.invalid
    end
  end
end
