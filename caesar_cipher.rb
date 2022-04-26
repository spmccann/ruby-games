# frozen_string_literal: true

# Caesar Cipher
def caesar_cipher(str, shift)
  alpha = ('a'..'z').to_a
  up_alpha = ('A'..'Z').to_a
  output = []
  str.split('').each do |letter|
    if alpha.include?(letter)
      letter_index = alpha.index(letter) + shift
      output += [alpha[letter_index]] if letter_index < 26 || output += [alpha[letter_index % 26]]
    elsif up_alpha.include?(letter)
      letter_index = up_alpha.index(letter) + shift
      output += [up_alpha[letter_index]] if letter_index < 26 || output += [up_alpha[letter_index % 26]]
    else
      output += [letter]
    end
  end
  puts output.join('')
end
caesar_cipher('What a string!', 5)
