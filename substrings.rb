# frozen_string_literal: true

# testing if string or substring matches dictionary
def substring(input, dictionary)
  words = input.downcase.split(' ')
  words_count = Hash.new(0)
  dictionary.each do |entry|
    words.each { |word| words_count[entry] += 1 if word == entry || word.include?(entry) }
  end
  puts words_count
end
dictionary = %w[below down go going horn how howdy it i low own part partner sit]
substring("Howdy partner, sit down! How's it going?", dictionary)
