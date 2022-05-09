# frozen_string_literal: true

# chess board
class KnightMoves
  def initialize(square, target)
    @square = square
    @target = target
    @ranks = [*0..7]
    @files = [*0..7]
    @pos = [*0..63]
    @all_sqs = []
    @moves = [[-2, -1], [-2, 1], [-1, 2], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end

  # creates all the possible postions on a chess board
  def positions
    i = 0
    while i < 8
      @all_sqs += @ranks.map { |r| [i, @files[r]] }
      i += 1
    end
    @all_sqs
  end

  # visual aid for positions on grid
  def board_maker
    i = 63
    j = 56
    while i >= 0
      p @all_sqs[j..i]
      i -= 8
      j -= 8
    end
  end

  # checks that the position coordinates are valid squares
  def valid_move(square = @square)
    true if @all_sqs.include?(square)
  end

  # given a current square, finds all available squares to move to
  def available_moves(square = @square)
    return nil unless valid_move(square)

    unchecked = @moves.map { |m| [m[0] + square[0], m[1] + square[1]] }
    @avail = unchecked.map { |move| move if valid_move(move) }.compact
  end

  # provides the index number for available moves between 0-63
  def avail_to_pos
    @all_sqs.map { |sq| p @all_sqs.index(sq) if @avail.include?(sq) }.compact
  end

  def target_pos
    p @all_sqs.index(@target) if valid_move(@target)
  end

  def search_target
  end
end
