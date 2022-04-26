# frozen_string_literal: true

require './game'
require './players'

# handles game flow/loop

display = Game.new
player = Players.new

if player.start == 'b'
  display.new_code('no code')
  breaker_loop = true
else
  maker_loop = true
  display.new_code(player.ask_code)
end

while breaker_loop
  player.rounds(display.next_round)
  display.pegs(player.ask_code)
  display.feedback
  abort if player.ending(display.result)
end

while maker_loop
  player.rounds(display.next_round)
  display.pegs(player.thinking)
  display.feedback
  abort if player.ending(display.result)
end
