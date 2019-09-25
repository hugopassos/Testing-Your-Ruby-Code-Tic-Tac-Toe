# frozen_string_literal: true

# spec/tictactoe_spec.rb

require_relative '../main.rb'

RSpec.describe Game do
  let(:array_1) { ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' '] }
  let(:array_2) { [3] }


# Test to make sure players win when they should, e.g. when the board reads X X X across the top row,
# your #game-over method (or its equivalent) should trigger.
  describe '#determine_winner' do
    it 'checks winning condition' do
      expect(determine_winner(array_1)).to eql(true)
      #expect(array_1.my_each { |x| x * 2 }).to eql(array_1)
      #expect(array_1.my_each { |x| x * 4 }).to eql(array_1)
    end
  end
end
