class Board

  attr_reader :all_squares, :winner

  def initialize
    @all_squares = []
    @winner = ''
    i = 1
    for y in 0..2 do
      for x in 0..2 do
        new_square = Square.new(x,y,i)
        @all_squares << new_square
        i += 1
      end
    end
  end

  def game_over_check
    over = false
    for i in 0..2 do
      if return_marked_by(i,0) == return_marked_by(i,1) && return_marked_by(i,0) == return_marked_by(i,2)
        if return_marked_by(i,0) != ""
          over = true
          @winner = return_marked_by(i,0)
        end
      elsif return_marked_by(0,i) == return_marked_by(1,i) && return_marked_by(0,i) == return_marked_by(2,i)
        if return_marked_by(0,i) != ""
          over = true
          @winner = return_marked_by(0,i)
        end
      end
    end
    if return_marked_by(0,0) == return_marked_by(1,1) && return_marked_by(0,0) == return_marked_by(2,2)
      if return_marked_by(0,0) != ""
        over = true
        @winner = return_marked_by(0,0)
      end
    elsif return_marked_by(2,0) == return_marked_by(1,1) && return_marked_by(2,0) == return_marked_by(0,2)
      if return_marked_by(2,0) != ""
        over = true
        @winner = return_marked_by(2,0)
      end
    end
    over
  end

  def return_marked_by(x,y)
    found_square = find_square(x,y)
    found_square.marked_by
  end

  def find_square(x,y)
    found_square = @all_squares.select {|square| square.x == x && square.y == y}
    found_square[0]
  end

  def make_move?(player_symbol,x,y)
    if return_marked_by(x,y) != "X" && return_marked_by(x,y) != "O"
      find_square(x,y).mark_square(player_symbol)
      true
    else
      false
    end
  end
end
