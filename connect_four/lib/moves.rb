# frozen_string_literal: true

# player moves and gameplay logic
class Moves
  def initialize
    @spaces = [*0..41]
  end

  def grid
    i = 0
    display_board = ''
    while i < 42
      display_board += "\n" if i % 7 == 0
      display_board += if i < 10
                         format('%02d', (@spaces[i])) + ' '
                       else
                         "#{@spaces[i]} "
                       end
      i += 1
    end
    display_board
  end

  def display_board
    puts grid
  end

  def drop_token(place)
    @spaces[place] = '⚫'
  end
end
