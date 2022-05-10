# frozen_string_literal: true

require_relative 'knight_moves'
require_relative 'knight'

ran = Random.new
start = [ran.rand(0..7), ran.rand(0..7)]
target = [ran.rand(0..7), ran.rand(0..7)]

knight = KnightMoves.new(start, target)
knight.positions
knight.search_target
# knight.board_coordinates
# knight.board_indexes
