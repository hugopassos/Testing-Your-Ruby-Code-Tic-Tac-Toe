# frozen_string_literal: true

# spec/game_spec.rb

require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

RSpec.describe Game do
  let(:player_one) { Player.new('Hugo', 'X') }
  let(:player_two) { Player.new('Ron', 'O') }
  let(:game) { Game.new(player_one, player_two) }
  let(:player_one_name) { 'Hugo' }
  let(:player_two_name) { 'Ron' }
  let(:valid) { [true, ''] }
  let(:invalid) { [false, 'Invalid entry, values must be between 1 and 9.'] }
  let(:invalid_not_empty) { [false, 'Invalid entry, you should choose an empty square.'] }
  let(:no_winner) { false }
  let(:there_is_winner) { true }

  describe '#switch_player' do
    it 'switches from player one to player two' do
      expect(game.switch_player.name).to eql(player_two_name)
      expect(game.switch_player.name).to eql(player_one_name)
    end
  end

  describe 'valid?' do
    it 'validates if an entry is valid or not' do
      expect(game.valid?(-1)).to eql(invalid)
      expect(game.valid?(0)).to eql(valid)
      expect(game.valid?(0)).to eql(invalid_not_empty)
      expect(game.valid?(1)).to eql(valid)
      expect(game.valid?(9)).to eql(invalid)
    end
  end

  describe 'determine_winner' do
    it 'checks conditions for winning the game' do
      expect(game.determine_winner).to eql(no_winner)
      game.valid?(0)
      game.valid?(1)
      game.valid?(2)
      expect(game.determine_winner).to eql(there_is_winner)
    end
  end
end
