# frozen_string_literal: true

# board updates
class Board
  def initialize
    @squares = Array.new(9, ' ')
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

  def placement(place, player)
    player == 'x' ? (@squares[place] = 'X') : @squares[place] = 'O'
  end

  def reset_board
    @squares = Array.new(9, ' ')
  end

  def tie
    reset_board unless @squares.include?(' ')
  end

  def win_cases
    wins = [
      @squares.values_at(0, 1, 2), @squares.values_at(3, 4, 5),
      @squares.values_at(6, 7, 8), @squares.values_at(0, 3, 6),
      @squares.values_at(1, 4, 7), @squares.values_at(2, 5, 8),
      @squares.values_at(0, 4, 8), @squares.values_at(2, 4, 6)
    ]
    if wins.include?(%w[X X X])
      reset_board
      @x = 'x'
    elsif wins.include?(%w[O O O])
      reset_board
    end
  end

  def won
    if @x == 'x'
      'x'
    else
      'o'
    end
  end

  def open_square(sqr)
    @squares[sqr] == ' '
  end
end
