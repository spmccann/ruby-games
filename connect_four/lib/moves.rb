# frozen_string_literal: true

# player moves and gameplay logic
class Moves
  attr_accessor(:place)

  def initialize(spaces = [*0..41])
    @spaces = spaces
    @place = nil
    @black_win = '⚫⚫⚫⚫'
    @white_win = '⚪⚪⚪⚪'
  end

  def grid
    i = 0
    wrap_grid = ''
    while i < 42
      wrap_grid += "\n" if (i % 7).zero?
      wrap_grid += if i < 10 && @spaces[i].is_a?(Integer)
                     format('%02d ', @spaces[i])
                   else
                     "#{@spaces[i]} "
                   end
      i += 1
    end
    wrap_grid
  end

  def display
    puts grid
  end

  def movement(move = gets.chomp)
    @place = move.to_i
  end

  def validation(turn)
    drop_token(turn) if valid_range && spot_not_taken && token_gravity
  end

  def drop_token(turn)
    @spaces[@place] = turn ? '⚫' : '⚪'
  end

  def valid_range
    @spaces.include?(@place)
  end

  def spot_not_taken
    @spaces[@place] != '⚫' || @spaces[@place] != '⚪'
  end

  def token_gravity
    (@spaces[@place] + 6 == '⚫' || @spaces[@place] + 6 == '⚪') || !@spaces.include?(@place + 7)
  end

  def game_over?
    horiz_four || vert_four || l_diag_four || r_diag_four
  end

  def horiz_four
    @spaces.each_slice(7) { |s| return true if s.join.include?(@black_win) || s.join.include?(@white_win) }
    false
  end

  def vert_four
    test_list = []
    h = 0
    while h < 7
      (h..@spaces.length).step(7) { |i| test_list << @spaces[i] }
      return true if test_list.join.include?(@black_win) || test_list.join.include?(@white_win)

      h += 1
    end
    false
  end

  def l_diag_four
    test_list = []
    l_diags = [(0..40), (1..41), (2..34), (3..27), (7..39), (14..38)]
    h = 0
    while h < l_diags.length
      l_diags[h].step(8) { |i| test_list << @spaces[i] }
      return true if test_list.join.include?(@black_win) || test_list.join.include?(@white_win)

      h += 1
    end
    false
  end

  def r_diag_four
    test_list = []
    r_diags = [(3..21), (4..28), (5..35), (6..36), (13..37), (20..38)]
    h = 0
    while h < r_diags.length
      r_diags[h].step(6) { |i| test_list << @spaces[i] }
      return true if test_list.join.include?(@black_win) || test_list.join.include?(@white_win)

      h += 1
    end
    false
  end

  def tie?
    @spaces.none?(0..41)
  end

  def reset(answer = gets.chomp)
    @spaces = [*0..41] if answer == 'yes'
  end
end
