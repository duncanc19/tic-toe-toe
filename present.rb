class Present
    def present_game(game)
        grid = []
        game.game_state.each do |row|
            grid_row = ''
            row.each do |square|
                grid_row << '-' if square == ''
                grid_row << 'x' if square == 'x'
            end 
            grid << grid_row 
        end
        grid.join("\n")
        # "---\n---\n---" 
    end 
end 
