# frozen_string_literal: true

require 'colorize'

# displays game updates
class Game
  # set up color visuals and color list
  def initialize
    @code_pegs = {
      'red': '■'.red, 'blue': '■'.blue, 'yellow': '■'.yellow,
      'green': '■'.green, 'white': '■'.white, 'purple': '■'.magenta
    }
    @code_colors = %i[red blue yellow green white purple]
    @round = 0
  end

  # create a random new code for breaker and grabs the code for maker
  def new_code(user_code = 'no code')
    @show_colorize_guess = []
    @generated_code = []
    if user_code == 'no code'
      4.times { @generated_code.push(@code_colors[rand(6)]) }
      @generated_code.each { |g| @show_colorize_guess.push(@code_pegs[g]) }
      # puts @show_colorize_guess.join(' ')
    else
      user_code.each { |g| @show_colorize_guess.push(@code_pegs[g]) }
      puts "You have selected the code #{@show_colorize_guess.join(' ')}"
      @player_code = user_code
    end
  end

  # code maker only. random guesses
  def make_a_code
    @show_maker_colorize = []
    @make_code = []
    4.times { @make_code.push(@code_colors[rand(6)]) }
    @make_code.each { |g| @show_maker_colorize.push(@code_pegs[g]) }
    @make_code
  end

  # assigns codes to test for maker. for both modes, outputs the visuals
  def pegs(guess)
    if guess == 12
      @generated_code = make_a_code
      puts "Computer guesses #{@show_maker_colorize.join(' ')}"
    else
      output = []
      guess.each { |g| output.push(@code_pegs[g]) }
      puts output.join(' ')
      @player_code = guess
    end
  end
  # checks if player guesses the code. else if player inputs are valid. else send to check each color and position
  def feedback
    if @player_code == @generated_code
      @round = 0
      @win = true
      puts "You found the code! (#{@show_colorize_guess.join(' ')})"
    elsif @player_code.length != 4 || @player_code.all? { |g| @code_colors.include?(g).! }
      puts 'invalid guess. Please try again. '
      @round -= 1
    else
      check_matches
    end
  end

  # checks each case for matches or no matches
  def check_matches
    count = 0
    test_code = @generated_code
    @generated_code.each_index do |i|
      if @player_code[i] == test_code[i]
        puts 'Correct color, correct postion'
        
      elsif @player_code.include?(test_code[i])
        puts 'Correct color, incorrect position'
        
      else
        count += 1
        puts 'None of your pegs are in the code!' if count == 4
      end
    end
  end

  # increments the rounds
  def next_round
    @round += 1
  end

  # sorts possible results
  def result
    if @round > 11
      lost
    elsif @win
      win
    else
      'game continues'
    end
  end

  # resets the game for win
  def win
    @win = false
    new_code
    'won'
  end

  # resets the game for loss
  def lost
    puts "the code was #{@show_colorize_guess.join(' ')}"
    @round = 0
    new_code
    'lost'
  end
end
