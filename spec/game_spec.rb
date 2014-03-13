require 'rspec'
require 'player'
require 'square'
require 'board'
require 'game'

describe 'Game' do
  describe 'initialize' do
    it 'initializes a new Game' do
        new_game = Game.new("Bob","Fred")
        new_game.should be_an_instance_of Game
    end
  end
  describe 'create' do
    it 'creates two Player objects' do
      new_game = Game.create("Bob", "Fred")
      new_game.should be_an_instance_of Game
      new_game.player_one.name.should eq 'Bob'
    end
  end
  describe 'who_goes_first' do
    it 'determines who is the first player randomly' do
      new_game = Game.create("Bob","Fred")
      new_game.player_one.symbol.should_not eq ("")
    end
  end
  describe 'switch_turn' do
    it 'switches current player' do
      new_game = Game.create("Bob","Susie")
      test_player = new_game.current_player
      new_game.switch_turn
      new_game.current_player.should_not eq test_player
    end
  end
end
