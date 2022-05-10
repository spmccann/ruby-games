# frozen_string_literal: true

require_relative 'knight_moves'
require_relative 'knight'

knight = KnightMoves.new([3, 3], [0, 0])
knight.positions
knight.available_moves
knight.available_positions
knight.search_target
