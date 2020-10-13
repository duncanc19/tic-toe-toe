require_relative 'constants'

class Present

    def show_grid(game)
        puts create_grid_as_string(game)
    end

    def create_grid_as_string(game)
        @grid = []
        current_game_state = game.game_state
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

end 
