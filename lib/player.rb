class Player
  attr_reader :name, :symbol
  def initialize(name)
    @name = name
    @symbol = ""
  end

  def set_symbol(symbol)
    @symbol = symbol
  end
end
