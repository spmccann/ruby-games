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
end
