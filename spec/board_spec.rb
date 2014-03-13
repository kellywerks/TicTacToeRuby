require 'rspec'
require 'board'
require 'square'

describe 'Board' do
  describe 'initialize' do
    it 'initializes with nine Squares' do
      new_board = Board.new
      new_board.should be_an_instance_of Board
    end
  end

  describe 'return_marked_by' do
    it 'returns the marked by value for a given square by coordinates' do
      new_board = Board.new
      new_board.all_squares[0].mark_square('X')
      new_board.return_marked_by(0,0).should eq 'X'
    end
  end

  describe 'game_over_check' do
    it 'determines if the game is over (win or 9 squares)' do
      new_board = Board.new
      new_board.game_over_check.should eq false
      new_board.all_squares[0].mark_square('X')
      new_board.all_squares[1].mark_square('X')
      new_board.all_squares[2].mark_square('X')
      new_board.game_over_check.should eq true
    end
  end

  describe 'make_move?' do
    it 'check if a square is available and mark it if so' do
      new_board = Board.new
      new_board.make_move?('X',0,0)
      new_board.return_marked_by(0,0).should eq 'X'
    end
  end
end
