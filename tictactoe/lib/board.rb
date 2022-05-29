# frozen_string_literal: true

# board updates
class Board
  def initialize
    @squares = []
  end

  def example_display
    puts "
    ---------
      0|1|2
      -+-+-
      3|4|5
      -+-+-
      6|7|8
    ---------
    "
  end

  def display
    puts "    Live Board
    ---------
      #{@squares[0]}|#{@squares[1]}|#{@squares[2]}
      -+-+-
      #{@squares[3]}|#{@squares[4]}|#{@squares[5]}
      -+-+-
      #{@squares[6]}|#{@squares[7]}|#{@squares[8]}
    ---------
    "
  end

  def placement(place, turn)
    @squares[place] = turn ? 'X' : 'O'
  end

  def reset_board
    @squares = Array.new(9, ' ')
  end

  def game_tie?
    !@squares.include?(' ')
  end

  def game_win?
    win_cases.include?(%w[X X X]) || win_cases.include?(%w[O O O])
  end

  def win_cases
    [
      @squares.values_at(0, 1, 2), @squares.values_at(3, 4, 5),
      @squares.values_at(6, 7, 8), @squares.values_at(0, 3, 6),
      @squares.values_at(1, 4, 7), @squares.values_at(2, 5, 8),
      @squares.values_at(0, 4, 8), @squares.values_at(2, 4, 6)
    ]
  end

  def open_square(sqr)
    @squares[sqr] == ' '
  end
end
