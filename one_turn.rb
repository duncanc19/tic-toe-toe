class OneTurn 
    def play_turn(present)
        game_controller = present.game_controller
        move = present.receive_input
        game_controller.verify_and_format_move(move)
        game_controller.play_move 
        present.create_grid_as_string
        present.output_to_command_line
    end
end