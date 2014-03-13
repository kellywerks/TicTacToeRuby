require './lib/game'
require './lib/player'
require './lib/board'
require './lib/square'

def start_game
  puts "============ WELCOME TO TIC-TAC-TOE ============"
  puts "\n\n\n\n\n"
  puts "Please enter the first player's name: \n\n"
  player_one = gets.chomp
  puts "Please enter the second player's name: \n\n"
  player_two = gets.chomp
  current_game = Game.create(player_one, player_two)
  main_menu(current_game)
end

def main_menu(game)
  puts "\n\n == Main Menu == \n\n"
  puts "#{game.current_player.name}'s turn!!\n\n"
  puts "\t\t\t #{game.game_board.all_squares[0].marked_by} | #{game.game_board.all_squares[1].marked_by} | #{game.game_board.all_squares[2].marked_by} "
  puts "\t\t\t___|___|___"
  puts "\t\t\t #{game.game_board.all_squares[3].marked_by} | #{game.game_board.all_squares[4].marked_by} | #{game.game_board.all_squares[5].marked_by} "
  puts "\t\t\t___|___|___"
  puts "\t\t\t #{game.game_board.all_squares[6].marked_by} | #{game.game_board.all_squares[7].marked_by} | #{game.game_board.all_squares[8].marked_by} "
  puts "\t\t\t   |   |   "
  puts "\n\n Please select your move by choosing a square's number: "
  puts "Press 'q' to quit."
  current_move = gets.chomp
  if current_move == 'q'
    exit
  else
    move = interpret_move(game, current_move.to_i)
  end
end

def interpret_move(game, current_move)
  move_hash = {7 => [0,2], 8 => [1,2], 9 => [2,2], 4 => [0,1], 5 => [1,1], 6 => [2,1], 1 => [0,0], 2 => [1,0], 3 => [2,0]}
  move = move_hash[current_move]
  check_move(game,move)
end

def check_move(game,move)
  if game.game_board.make_move?(game.current_player.symbol,move[0],move[1])
    if game.game_complete == false
      game.switch_turn
      main_menu(game)
    else
      game_result = game.game_complete
      result_screen(game_result)
    end
  end
end

def result_screen(game_result)
end

start_game
