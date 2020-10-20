
class Main
    def play_game(present, game, verify, get_input)
        present.show_message(Messages.message_hash(:welcome))
        present.show_message(Messages.message_hash(:select_game))

        game_type = get_input.get_game_type
        while game_type.nil? do
            present.show_message(Messages.message_hash(:invalid_game_type))
            game_type = get_input.get_game_type
        end
        present.show_message(Messages.message_hash(game_type))

        present.show_grid(game)
        loop do
            current_player_symbol = present.player_symbol(game.current_player)
            
            present.show_message(Messages.player_turn_message(current_player_symbol))
            present.show_message(Messages.message_hash(:enter_move))

            begin
                if game_type == :computer_game && game.current_player == 'o'
                    computer_turn(game)
                else
                    turn(get_input, verify, game, present)
                end
            rescue StandardError => game_ended
                present.show_message(game_ended.message)
                break
            end
            present.show_grid(game)
            
            if CheckWin.check_win(game)
                present.show_message(Messages.winning_message(current_player_symbol))
                break 
            end
            if CheckDraw.check_draw(game)
                present.show_message(Messages.message_hash(:draw))
                break 
            end
            game.next_player
        end
        
    end


    def turn(get_input, verify, game, present)
        move = false
        while !move do
            move = get_input.get_move
            raise Messages.message_hash(:game_ended) if move == 'quit'
            move = verify.verify_and_convert_move(move, game.game_state)
            present.show_message(Messages.message_hash(:invalid_move)) if !move
        end 
        game.add_move(move[0], move[1])
    end


    def computer_turn(game)
        move = Computer.turn(game.game_state)
        game.add_move(move[0], move[1])
    end


end