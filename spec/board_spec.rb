# frozen_string_literal: true

# spec/game_spec.rb
require_relative '../lib/board.rb'

RSpec.describe Board do
  let(:sq_val) { [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '] }
  let(:valid) { [true, ''] }
  let(:invalid_range) { [false, 'Invalid entry, values must be between 1 and 9.'] }
  let(:invalid_taken) { [false, 'Invalid entry, you should choose an empty square.'] }
  let(:board) { Board.new }

  describe '#initalize' do
    it 'create an array of 9 string elements, each with a value of one space.' do
      expect(board.sq_val).to eql(sq_val)
    end
  end

  describe '#square_play' do
    it 'takes the players choice (an integer) and weapon (X or O) and returns true if valid : false if invalid' do
      expect(board.square_play(0, 'X')).to eql(valid)
      expect(board.square_play(0, 'X')).to eql(invalid_taken)
      expect(board.square_play(-9, 'X')).to eql(invalid_range)
    end
  end

  describe '#check_rows' do
    it 'checks rows for three in a row' do
      board.square_play(0, 'X')
      board.square_play(1, 'X')
      expect(board.check_rows).to eql(false)
      board.square_play(2, 'X')
      expect(board.check_rows).to eql(true)
    end
  end

  describe '#check_columns' do
    it 'checks columns for three in a row' do
      board.square_play(0, 'X')
      board.square_play(3, 'X')
      expect(board.check_columns).to eql(false)
      board.square_play(6, 'X')
      expect(board.check_columns).to eql(true)
    end
  end

  describe '#check_diagonal_one' do
    it 'checks diagonal from top left to bottom right for three in a row' do
      board.square_play(0, 'X')
      board.square_play(4, 'X')
      expect(board.check_diagonal_one).to eql(false)
      board.square_play(8, 'X')
      expect(board.check_diagonal_one).to eql(true)
    end
  end

  describe '#check_diagonal_two' do
    it 'checks diagonal from top right to bottom left for three in a row' do
      board.square_play(2, 'X')
      board.square_play(4, 'X')
      expect(board.check_diagonal_two).to eql(false)
      board.square_play(6, 'X')
      expect(board.check_diagonal_two).to eql(true)
    end
  end
end
