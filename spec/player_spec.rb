require 'rspec'
require 'player'

describe 'Player' do
  describe 'initialize' do
    it 'creates an instance of Player' do
      new_player = Player.new('Bob')
      new_player.should be_an_instance_of Player
    end
  end
  describe 'set_symbol' do
    it 'sets the players symbol to the passed in symbol' do
      new_player = Player.new('George')
      new_player.set_symbol('X')
      new_player.symbol.should eq 'X'
    end
  end
end
