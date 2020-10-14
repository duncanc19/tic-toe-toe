
class Main
    def play_game(present, game, verify, get_input)
        # present.output_message_to_command_line_newline(Messages.message_hash(:welcome))
        present.show_grid(game)
        while (!CheckDraw.check_draw(game)) do
            turn(get_input, verify, game)
            present.show_grid(game)
            break if CheckWin.check_win(game)
            game.next_player
        end
    end
    def turn(get_input, verify, game)
        move = false
        while !move do
            move = get_input.get_move
            move = verify.verify_and_convert_move(move, game.game_state)
        end 
        game.add_move(move[0], move[1])
    end
end