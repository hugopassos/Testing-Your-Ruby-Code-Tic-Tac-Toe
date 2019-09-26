# frozen_string_literal: true

# spec/player_spec.rb

require_relative '../lib/player.rb'

RSpec.describe Player do
  let(:name) { "Hugo" }
  let(:weapon) { "X" }

  describe '#initialize' do
    player = Player.new("Hugo", "X")

    it 'sets up the player name' do
      expect(player.name).to eql(name)
    end

    it 'sets up the weapon' do
      expect(player.weapon).to eql(weapon)
    end
  end
end
