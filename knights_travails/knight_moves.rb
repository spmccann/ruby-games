# frozen_string_literal: true

# chess board
class KnightMoves
  def initialize(knight, target)
    @knight = knight
    @target = target
    @ranks = [*0..7]
    @files = [*0..7]
    @pos = [*0..63]
    @all_sqs = []
    @moves = [[-2, -1], [-2, 1], [-1, 2], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  end

  # creates all 64 postions on a chess board
  def positions
    i = 0
    while i < 8
      @all_sqs += @ranks.map { |r| [@files[r], i] }
      i += 1
    end
    @all_sqs
  end

  # visual aid for board coordinates
  def board_coordinates
    i = 63
    j = 56
    while i >= 0
      p @all_sqs[j..i]
      i -= 8
      j -= 8
    end
  end

  # visual aid for board numbers
  def board_indexes
    i = 63
    j = 56
    while i >= 0
      p @pos[j..i]
      i -= 8
      j -= 8
    end
  end

  # checks that the position coordinates are valid squares. defaults to knight
  def valid_move(knight = @knight)
    true if @all_sqs.include?(knight)
  end

  # given an array of current coordinates, finds all available squares to move to. defaults to knight
  def available_moves(knight = @knight)
    return nil unless valid_move(knight)

    unchecked = @moves.map { |m| [m[0] + knight[0], m[1] + knight[1]] }
    unchecked.map { |move| move if valid_move(move) }.compact
  end

  # provides the indexes for available_moves between 0-63 given array of coordinates. defaults to knight
  def available_positions(knight = @knight)
    @all_sqs.map { |sq| @all_sqs.index(sq) if available_moves(knight).include?(sq) }.compact
  end

  # get index of a square. defualts to knight
  def square_index(knight = @knight)
    @all_sqs.index(knight) if valid_move(knight)
  end

  # gets the coordinates for '1-away' squares between knight and target
  def common_coord
    pos = available_positions & available_positions(@target)
    @all_sqs.at(pos[0]) if pos.any?
  end

  # search for path from start to target
  def search_target(knight = @knight, count = 2)
    if knight == @target
      puts count < 3 ? "You're already there!\n#{knight}" : 'something'
    elsif available_positions.include?(square_index(@target))
      puts count < 3 ? "You made it in 1 move! Here's your path:\n#{knight}\n#{@target}" : 'something2'
    elsif common_coord
      puts count < 3 ? "You made it in 2 moves! Here's your path:\n#{knight}\n#{common_coord}\n#{@target}" : 'something3'
    else
      count += 1
      puts "You made it in #{count} moves! Here's your path:\n#{knight}\n[some, coords]\n#{@target}"
    end
  end
end
