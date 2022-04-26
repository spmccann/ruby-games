# frozen_string_literal: true

# player messaging
class Players
  def start
    puts 'Welcome to Mastermind: A Game of Codemakers and Codebreakers'
    puts 'Would you like to be the Codemaker or Codebreaker (m/b)?'
    gets.chomp.downcase
  end

  def ask_code
    puts "Enter four colors, each separated by a space\n(options: red, blue, yellow, green, white or purple):"
    gets.chomp.downcase.split.map(&:to_sym)
  end

  def rounds(round)
    puts "\nMastermind Round #{round} (of 12)"
  end

  def ending(result)
    case result
    when 'won'
      puts 'The codebreaker won. Would you like to try again? (y/n)?'
      gets.chomp == 'n'
    when 'lost'
      puts 'The codemaker won. Would you like try again? (y/n)?'
      gets.chomp == 'n'
    end
  end

  # code maker only
  def thinking
    puts 'Computer is thinking... '
    sleep(1)
    12
  end
end
