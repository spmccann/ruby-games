# frozen_string_literal: true

# player moves and gameplay logic
class Moves
  def initialize(space = [*0..41])
    @spaces = space
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

  def display_board
    puts grid
  end

  def drop_token(place)
    @spaces[place] = '⚫'
  end

  def validate_move(place = gets.chomp)
    if /\d/.match(place) && place.to_i.between?(0, 41)
      drop_token(place.to_i)
    else
      puts 'invalid move'
    end
  end
end
