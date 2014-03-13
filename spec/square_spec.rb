require 'rspec'
require 'square'

describe 'Square' do
  describe 'initialize' do
    it 'initializes a new Square' do
      new_square = Square.new(1,2)
      new_square.should be_an_instance_of Square
    end

    it 'initializes property marked_by to empty string' do
      new_square = Square.new(1,2)
      new_square.marked_by.should eq ("")
    end
  end

  describe 'mark_square' do
    it 'marks the square with the received player symbol' do
      new_square = Square.new(1,2)
      new_square.mark_square("X")
      new_square.marked_by.should eq ("X")
    end
  end
end
