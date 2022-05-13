# frozen_string_literal: true

# Finding path for knight to target
class KnightMoves
  def initialize(knight, target)
    @knight = knight
    @target = target
    @ranks = [*0..7]
    @files = [*0..7]
    @pos = [*0..63]
    @all_sqs = positions
    @moves = [[-2, -1], [-2, 1], [-1, 2], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    @root = build_tree(knight)
  end

  # creates all 64 postions on a chess board
  def positions
    all_sqs = []
    i = 0
    while i < 8
      all_sqs += @ranks.map { |r| [@files[r], i] }
      i += 1
    end
    all_sqs
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
    unchecked.map { |move| move if valid_move(move) }.compact.uniq
  end

  # index numbers for available_moves between 0-63 given array of coordinates. defaults to knight
  def available_positions(knight = @knight)
    @all_sqs.map { |sq| @all_sqs.index(sq) if available_moves(knight).include?(sq) }.compact
  end

  # get index of a square. defaults to knight
  def square_index(knight = @knight)
    @all_sqs.index(knight) if valid_move(knight)
  end

  # gets the coordinates for '1-away' squares between knight and target
  def com_cord(knight = @knight)
    pos = available_positions(knight) & available_positions(@target)
    @all_sqs.at(pos[0]) if pos.any?
  end

  # search for path from start to target
  def search_target(steps = [], knight = @knight, used = [])
    steps << "#{knight}\n"
    if knight == @target
      puts "You're already there!\n#{knight}"
    elsif available_positions(knight).include?(square_index(@target))
      puts "You made it in 1 move! Here's your path:\n#{knight}\n#{@target}"
    elsif com_cord(knight)
      puts "You made it in #{steps.length + 1} moves! Here's your path:\n#{steps.join}#{com_cord(knight)}\n#{@target}"
    else
      deep_search(steps, knight, used)
    end
  end

  def deep_search(steps, knight, used)
    select_move = available_moves(knight)[0]
    select_move = available_moves(knight)[-1] if used.include?(select_move)
    used << select_move
    search_target(steps, select_move, used)
  end

  def build_tree(knight = @knight)
    node = square_index(knight)
    root = Knight.new(node)
    root.one << moves = available_positions(knight)
    root.two << more_moves = moves.flatten.map { |m| available_positions(@all_sqs.at(m)) }
    root.three << even_more_moves = more_moves.flatten.map { |m| available_positions(@all_sqs.at(m)) }
    root.four << last_moves = even_more_moves.flatten.map { |m| available_positions(@all_sqs.at(m)) }
    root.five << last_moves.flatten.map { |m| available_positions(@all_sqs.at(m)) }
    root
  end

  def find_path(level = 0, node = nil)
    if level == 4
      next_node = @root.four.flatten.at(node[0])
      node = @root.four[0][0].map.with_index { |arr, i| i if arr.include?(next_node) }.compact
      p next_node
    elsif level == 3
      next_node = @root.three.flatten.at(node[0])
      node = @root.three[0].map.with_index { |arr, i| i if arr.include?(next_node) }.compact
      p next_node
    elsif level == 2
      next_node = @root.two.flatten.at(node[0])
      node = @root.two[0].map.with_index { |arr, i| i if arr.include?(next_node) }.compact
      p next_node
    elsif level == 1
      next_node = @root.one.flatten.at(node[0])
      node = @root.one.map.with_index { |arr, i| i if arr.include?(next_node) }.compact
      p next_node
    else
      @root.position
    end
    level -= 1
    find_path(level, node) if level.positive?
  end

  def reach_target
    goal = square_index(@target)
    if @root.position == goal
      p 'found in zero'
    elsif @root.one.flatten.include?(goal)
      level = 1
      node = @root.one.map.with_index { |arr, i| i if arr.include?(goal) }.compact
      find_path(level, node)
    elsif @root.two.flatten.include?(goal)
      level = 1
      node = @root.two[0].map.with_index { |arr, i| i if arr.include?(goal) }.compact
      find_path(level, node)
    elsif @root.three.flatten.include?(goal)
      level = 2
      node = @root.three[0].map.with_index { |arr, i| i if arr.include?(goal) }.compact
      find_path(level, node)
    elsif @root.four.flatten.include?(goal)
      level = 3
      node = @root.four[0][0].map.with_index { |arr, i| i if arr.include?(goal) }.compact
      find_path(level, node)
    elsif @root.five.flatten.include?(goal)
      level = 4
      node = @root.five[0][0][0].map.with_index { |arr, i| i if arr.include?(goal) }.compact
      find_path(level, node)
    end
  end

  def every_move
    @all_sqs.map { |sq| available_moves(sq) }
  end
end
