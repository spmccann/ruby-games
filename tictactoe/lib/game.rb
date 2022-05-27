# frozen_string_literal: true

require './board'
require './flow'

board = Board.new
flow = GameFlowMessages.new

flow.start_game ? game_status = true : abort
flow.player_names
board.example_display
turn = true

while game_status
  if board.win_cases
    flow.winner(board.won)
    flow.start_game ? board.display : abort
  elsif board.tie
    puts "It's a tie!"
    flow.start_game ? board.display : abort
  elsif turn
    choice = flow.make_move('x')
    if board.open_square(choice)
      board.placement(choice, 'x')
      turn = false
      board.display
    else
      puts("Space is taken, #{flow.names[0]}!")
    end
  else
    choice = flow.make_move('o')
    if board.open_square(choice)
      board.placement(choice, 'o')
      turn = true
      board.display
    else
      puts("Space is taken, #{flow.names[1]}!")
    end
  end
end
