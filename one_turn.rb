class OneTurn 
    def play_turn(present)
        game_controller = present.game_controller
        move = false
        while !move do
            move = present.receive_input
            move = game_controller.verify_and_format_move(move)
        end
        
        game_controller.play_move 
        present.create_grid_as_string
        present.output_to_command_line
    end
end