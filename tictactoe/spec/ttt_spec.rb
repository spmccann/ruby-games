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

    context 'when there\'s no tic tac toe' do
      it 'returns false' do
        allow(game).to receive(:win_cases).and_return([["X", " ", "X"], [" ", " ", " "], [" ", "O", "O"], ["X", " ", " "], ["X", " ", "O"], ["X", " ", "O"], ["X", " ", "O"], ["X", " ", " "]])
        expect(game.game_win?).to eq(false)
      end
    end

    context 'when O gets a ttt' do
      it 'returns true' do
        allow(game).to receive(:win_cases).and_return([["X", " ", "X"], [" ", " ", " "], ["O", "O", "O"], ["X", " ", " "], ["X", " ", "O"], ["X", " ", "O"], ["X", " ", "O"], ["X", " ", " "]])
        expect(game.game_win?).to eq(true)
      end
    end

    context 'when a diagonal ttt occurs' do
      it 'returns true' do
        allow(game).to receive(:win_cases).and_return([["X", " ", "X"], [" ", " ", " "], ["O", "", "O"], ["X", " ", " "], ["X", " ", "O"], ["O", "O", "O"], ["X", " ", "O"], ["X", " ", " "]])
        expect(game.game_win?).to eq(true)
      end
    end
  end

  describe '#game_tie?' do
    subject(:game) { described_class.new(["X", "O", "X", "X", "O", "O", "O", "X", "X"]) }
    context 'when it\'s a tie' do
      it 'returns true' do
        expect(game.game_tie?).to eq(true)
      end
    end

    context 'when it\'s not a tie' do
      subject(:game) { described_class.new( [" ", " ", " ", "X", "O", "O", "O", "X", "X"]) }
      it 'returns false' do
        expect(game.game_tie?).to eq(false)
      end
    end
  end
end
