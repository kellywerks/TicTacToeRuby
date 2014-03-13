class Game

  attr_reader :player_one, :player_two, :current_player, :game_result, :game_board

  def Game.create(name1,name2)
    new_game = Game.new(name1, name2)
    new_game.who_goes_first
    new_game
  end

  def initialize(name1,name2)
    @player_one = Player.new(name1)
    @player_two = Player.new(name2)
    @game_board = Board.new
    @counter = 0
  end

  def who_goes_first
    number = rand(2)
    if number == 1
      @player_one.set_symbol('X')
      @player_two.set_symbol('O')
      @current_player = @player_one
    else
      @player_two.set_symbol('X')
      @player_one.set_symbol('O')
      @current_player = @player_two
    end
  end

  def switch_turn
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
    @counter += 1
  end

  def game_complete
    if @counter == 8
      @game_result = "Cat's Game"
    elsif game_board.game_over_check == true
      @game_result = "Winner: #{game_board.winner}"
    else
      @game_result = false
    end
  end
end
