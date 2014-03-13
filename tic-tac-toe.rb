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
  elsif current_move == /\d/
    move = interpret_move(game, current_move.to_i)
  else
    puts "Not a valid input. Pay more attention, you fool."
    main_menu
  end
end

def interpret_move(game, current_move)
  move_hash = {7 => [0,2], 8 => [1,2], 9 => [2,2], 4 => [0,1], 5 => [1,1], 6 => [2,1], 1 => [0,0], 2 => [1,0], 3 => [2,0]}
  move = move_hash[current_move]
  check_move(game,move)
end

def check_move(game,move)
  if game.game_board.make_move?(game.current_player.symbol,move[0],move[1])
    game.switch_turn
    if game.game_complete == false
      main_menu(game)
    else
      game_result = game.game_complete
      result_screen(game_result)
    end
  else
    puts "\n\nIllegal move, you fool!\n\n"
    main_menu(game)
  end
end

def result_screen(game_result)
  if game_result == "Cat's Game"
    puts "
                 ________________
                |                |_____    __
                |  Cat's Game!   |     |__|  |_________
                |________________|     |::|  |        /
   /\\ **/\\      |                 \\____|::|__|      <
  ( o_o  )_     |                      \\::/   \\_______\\
   (u--u    _)  |
    (||___   )==\\
  ,dP'/b/=( /P'/b\\
  |8 || 8 === || 8
  `b,  ,P  `b,  ,P
    '''`     '''`"
  else
    puts "
                .   '  '    .
                )\\_/|_/|__  /
              .-'        /_/(      #{game_result}!!
             '  .-'`'-.   /_(
            /  (   o   ) /___(
           /u   '-._.-'  \\ _(/
          ^--------^-^-)  )  \\_     /|
          \\ ____________       '-._.)\\
            (,(,(,(________)_____..---'
    "
  end
  puts "\n\n\nPlay Again? Enter 'y' or 'n'"
  choice = gets.chomp
  if choice == 'y'
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    start_game
  else
    quit
  end
end

start_game

