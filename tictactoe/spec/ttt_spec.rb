# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#game_win?' do
    subject(:game) { described_class.new }
    context 'when a player gets tic tac toe' do
      it 'returns true' do
        allow(game).to receive(:win_cases).and_return([["X", "X", "X"], [" ", " ", " "], [" ", "O", "O"], ["X", " ", " "], ["X", " ", "O"], ["X", " ", "O"], ["X", " ", "O"], ["X", " ", " "]])
        expect(game.game_win?).to eq(true)
      end
    end
  end
end
