class OneTurn 
    def play_turn(present, game_controller)
        get_valid_move(present, game_controller)
        present.show_grid(game_controller)
    end

    
    def get_valid_move(present, game_controller)
        valid_move = false
        while !valid_move
            valid_move = get_correct_format_input(present, game_controller)
            valid_move =game_controller.play_move
        end 
    end
    
    def get_correct_format_input(present, game_controller)
        move = false
        while !move do
            move = present.receive_input
            move = game_controller.verify_and_format_move(move)
        end
    end

end