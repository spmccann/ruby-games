# frozen_string_literal: true

# player moves and gameplay logic
class Moves
  attr_accessor(:place)

  def initialize(space = [*0..41])
    @spaces = space
    @place = nil
  end

  def grid
    i = 0
    display_board = ''
    while i < 42
      display_board += "\n" if i % 7 == 0
      display_board += if i < 10 && @spaces[i].is_a?(Integer)
                         format('%02d', (@spaces[i])) + ' '
                       else
                         "#{@spaces[i]} "
                       end
      i += 1
    end
    display_board
  end

  def display
    puts grid
  end

  def drop_token(turn)
    @spaces[@place] = turn ? '⚫' : '⚪'
  end

  def valid_range(move = gets.chomp)
    if /\d/.match(move) && move.to_i.between?(0, 41)
      @place = move.to_i
    else
      puts 'Outside of board. Please try again'
      valid_range
    end
  end

  def spot_take
    puts 'Grid spot taken. Please try again' if @spaces[@place] == '⚫' || @spaces[@place] == '⚪'
  end

  def token_gravity
    if @spaces[@place] + 6 != '⚫' || @spaces[@place] + 6 != '⚪'
      puts 'Gravity still exists! Please try agin'
    end
  end
end
