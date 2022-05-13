# frozen_string_literal: true

require_relative 'knight_moves'
require_relative 'knight'

count = 0
while count < 100
  puts '-------------------------'
  ran = Random.new
  p start = [ran.rand(0..7), ran.rand(0..7)]
  p target = [ran.rand(0..7), ran.rand(0..7)]
  knight = KnightMoves.new(start, target)
  knight.positions
  knight.build_tree
  knight.reach_target
  knight.find_path
  knight.show_path
  puts '-------------------------'
  count += 1
  # knight.board_coordinates
  # knight.board_indexes
end

# puts '-------------------------'
# knight = KnightMoves.new([0, 2], [6, 5])
# knight.positions
# knight.build_tree
# knight.reach_target
# knight.find_path
# knight.show_path
# puts '-------------------------'

# knight.board_coordinates
# knight.board_indexes
