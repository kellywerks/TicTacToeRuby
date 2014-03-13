class Square
  attr_reader :x, :y, :marked_by

  def initialize(x,y,number)
    @x = x
    @y = y
    @marked_by = number
  end

  def mark_square(symbol)
    @marked_by = symbol
  end
end
