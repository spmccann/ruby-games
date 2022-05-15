# frozen_string_literal: true

require_relative 'knight_moves'
require_relative 'knight'

count = 0
while count < 100
  puts '-------------------------'
  ran = Random.new
  start = [ran.rand(0..7), ran.rand(0..7)]
  target = [ran.rand(0..7), ran.rand(0..7)]
  knight = KnightMoves.new(start, target)
  knight.positions
  knight.build_tree
  knight.reach_target
  knight.show_path
  puts "-------------------------\n"
  count += 1
end

# puts '-------------------------'
# knight = KnightMoves.new([1, 0], [1, 7])
# knight.positions
# knight.build_tree
# knight.reach_target
# knight.show_path
# puts '-------------------------'
