
class Main
    def play_game(present, game, verify, get_input)
        present.show_message(Messages.message_hash(:welcome))
        present.show_grid(game)
        while (!CheckDraw.check_draw(game)) do
            current_player_symbol = present.player_symbol(game.current_player)
            
            present.show_message(Messages.player_turn_message(current_player_symbol))
            present.show_message(Messages.message_hash(:enter_move))

            begin
                turn(get_input, verify, game, present)
            rescue StandardError => e
                puts e.message
                break
            end
            present.show_grid(game)
            if CheckWin.check_win(game)
                present.show_message(Messages.winning_message(current_player_symbol))
                break 
            end
            game.next_player
        end
    end

    def turn(get_input, verify, game, present)
        move = false
        while !move do
            move = get_input.get_move
            raise "Game has ended" if move == 'quit'
            move = verify.verify_and_convert_move(move, game.game_state)
            present.show_message(Messages.message_hash(:invalid_move)) if !move
        end 
        game.add_move(move[0], move[1])
    end
end