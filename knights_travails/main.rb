# frozen_string_literal: true

require_relative 'knight_moves'
require_relative 'knight'

knight = KnightMoves.new([3, 3], [1, 2])
knight.positions
knight.available_moves
knight.avail_to_pos
