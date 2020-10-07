require_relative 'constants'

class Present
    attr_accessor :game_controller, :input
    def initialize
        @game_controller = GameController.new
        create_grid_as_string
        output_to_command_line
        @input = GetInput.new
    end

    def create_grid_as_string
        @grid = []
        current_game_state = @game_controller.game.game_state
        current_game_state.each do |row|
            grid_row = ''
            row.each do |square|
                grid_row << EMPTY_SYMBOL if square == ''
                grid_row << PLAYER1_SYMBOL if square == 'x'
                grid_row << PLAYER2_SYMBOL if square == 'o'
            end 
            @grid << grid_row 
        end
        @grid.join("\n")
    end 

    def receive_input
        @input.get_move
    end

    def output_to_command_line
        puts @grid
    end 
end 
