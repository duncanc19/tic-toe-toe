class OneTurn 
    def play_turn(present, get_input, game)
        get_valid_move(get_input, game)
        present.show_grid(game)
    end

    
    def get_valid_move(get_input, game)
        valid_move = false
        while !valid_move
            valid_move = get_correct_format_input(get_input, game)
            valid_move =game.play_move
        end 
    end
    
    def get_correct_format_input(get_input, game)
        move = false
        while !move do
            move = get_input.get_move
            move = game.verify_and_format_move(move)
        end
    end

end