# frozen_string_literal: true

# spec/tictactoe_spec.rb

require_relative '../bin/main.rb'
require_relative '../lib/board.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

RSpec.describe Game do  
  describe '#determine_winner' do
    it 'checks winning condition' do
      game = Game.new
      expect(game.determine_winner).to eql(true)
    end
  end
end
