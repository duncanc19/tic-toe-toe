require_relative 'constants'

class Present

    def present_game(game)
        grid = []
        game.game_state.each do |row|
            grid_row = ''
            row.each do |square|
                grid_row << EMPTY_SYMBOL if square == ''
                grid_row << PLAYER1_SYMBOL if square == 'x'
                grid_row << PLAYER2_SYMBOL if square == 'o'
            end 
            grid << grid_row 
        end
        grid.join("\n")
    end 
    
    def output_to_command_line(string)
        puts string
    end 
end 
