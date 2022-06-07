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
    test_list = []
    @spaces.each_with_index do |s, i|
      test_list << 'end of row' if (i % 7).zero?
      test_list << s
    end
    test_list.join.include?(@black_win) || test_list.join.include?(@white_win)
  end

  def vert_four
    test_list = []
    h = 0
    while h < 7
      @spaces.each_with_index do |s, i|
        test_list << s if ((i + h) % 7).zero?
      end
      test_list << 'end of column'
      h += 1
    end
    test_list.join.include?(@black_win) || test_list.join.include?(@white_win)
  end

  def l_diag_four
    test_list = []
    h = 0
    while h < 7
      @spaces.each_with_index do |s, i|
        test_list << s if ((i + h) % 8).zero?
      end
      test_list << 'end of diagonal'
      h += 1
    end
    p test_list
    test_list.join.include?(@black_win) || test_list.join.include?(@white_win)
  end

  def r_diag_four
    test_list = []
    h = 0
    while h < 7
      @spaces.each_with_index do |s, i|
        test_list << s if ((i + h) % 6).zero?
      end
      test_list << 'end of diagonal'
      h += 1
    end
    test_list.join.include?(@black_win) || test_list.join.include?(@white_win)
  end
end
