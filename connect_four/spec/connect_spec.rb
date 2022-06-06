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
    context 'when a token is dropped into the grid' do
      it 'updates the number to a token for player 1 ⚫' do
        game.instance_variable_set(:@place, 35)
        expect(game.drop_token(true)).to eq('⚫')
      end
    end

    context 'when a token is dropped into the grid' do
      it 'updates the number to a token for player 2 ⚪' do
        game.instance_variable_set(:@place, 35)
        expect(game.drop_token(false)).to eq('⚪')
      end
    end
  end

  describe '#validation' do
    context 'when a number is entered outside of grid range' do
      it 'does not place the token' do
        game.instance_variable_set(:@place, 43)
        expect(game.validation(true)).to eq(nil)
      end
    end

    context 'when a number is entered within grid range' do
      it 'returns the token to place' do
        game.instance_variable_set(:@place, 36)
        expect(game.validation(true)).to eq('⚫')
      end
    end

    context 'when a token placement does not follow gravity' do
      it 'returns nil and not the token' do
        game.instance_variable_set(:@place, 29)
        expect(game.validation(true)).to eq(nil)
      end
    end

    context 'when a player tries a grid spot already taken' do
      it 'returns nil and not the token' do
        grid_state = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, "⚫", 37, 38, 39, 40, 41]
        game.instance_variable_set(:@spaces, grid_state)
        game.instance_variable_set(:@place, 36)
        expect(game.validation(true)).to eq(nil)
      end
    end

    context 'when a player tries a grid spot above one already taken' do
      it 'returns the token' do
        grid_state = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, "⚫", 37, 38, 39, 40, 41]
        game.instance_variable_set(:@spaces, grid_state)
        game.instance_variable_set(:@place, 29)
        expect(game.validation(true)).to eq('⚫')
      end
    end
  end
end
