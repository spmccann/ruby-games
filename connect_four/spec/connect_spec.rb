# frozen_string_literal: true

require_relative '../lib/moves'

describe Moves do
  subject(:game) { described_class.new }
  describe '#grid' do
    it 'returns a visual 6x7 space grid for tokens' do
      print_grid = "\n00 01 02 03 04 05 06 \n07 08 09 10 11 12 13 \n14 15 16 17 18 19 20 \n21 22 23 24 25 26 27 \n28 29 30 31 32 33 34 \n35 36 37 38 39 40 41 "

      expect(game.grid).to eq(print_grid)
    end
  end

  describe '#drop_token' do
    it 'drops a token into the grid' do
    end
  end
end
