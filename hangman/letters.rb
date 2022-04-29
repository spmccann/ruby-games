# frozen_string_literal: true

require 'json'

# hangman actions
class Letters
  def initialize
    @lives = 6
    @selection = select_word
    @in_word = Array.new(@selection.length, '_')
    @not_in_word = []
  end

  def select_word
    words = File.open('words.txt', 'r')
    rw = []
    words.each { |w| rw.push(w) if w.length > 5 && w.length < 13 }
    rw.sample.strip!
  end

  def letter_check(guess)
    if guess.empty? || guess.length > 1 || guess.match?(/[^a-z]/)
      puts 'Only letters, plz!'
    elsif @selection.include?(guess)
      found_in_word(guess)
    else
      not_found_in_word(guess)
    end
  end

  def found_in_word(guess)
    @selection.each_char.with_index { |s, i| @in_word[i] = s if s == guess }
    puts 'That letter is in the word!'
    puts @in_word.join(' ')
  end

  def not_found_in_word(guess)
    @not_in_word.push(guess)
    puts "Not in the word. Incorrect guesses: #{@not_in_word.join('')}."
    puts @in_word.join(' ')
    lives_lost
  end

  def lives_lost
    @lives -= 1
    puts "You have #{@lives} lives left"
  end

  def winner_check
    if @selection == @in_word.join('').to_s
      puts 'You got the word!'
      reset_game
    end
  end

  def game_over
    if @lives.zero?
      puts "Game over! The word was #{@selection}"
      reset_game
    end
  end

  def reset_game
    @in_word = Array.new(@selection.length, '_')
    @not_in_word = []
    @selection = select_word
    @lives = 6
  end

  def save_game
    data = "[#{@selection}, #{@lives}, #{@not_in_word}, #{@in_word}]"
    Dir.mkdir('saves') unless Dir.exist?('saves')
    save_file = 'saves/my_game.txt'
    File.open(save_file, 'w') { |f| f.puts data }
  end

  def load_game
    user_load = File.open('saves/my_game.txt', 'r').readline
    saved = JSON.parse(user_load)
    p saved
    @selection = saved[0]
    @lives = saved[1]
    @not_in_word = saved[2]
    @in_word = saved[3]
  end
end
