

class Present

    PLAYER1_SYMBOL = 'X'
    PLAYER2_SYMBOL = 'O'
    EMPTY_SYMBOL = '-'
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
        # "---\n---\n---" 
    end 
end 
