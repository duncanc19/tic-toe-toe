class Computer
    def self.winning_move(game_state)
        
        game_state.each_with_index do |row, row_index|
            row.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.current_player = 'o'
                    temp_game.game_state = game_state.map(&:clone)
                    temp_game.add_move(row_index, col_index)
                    return [row_index,col_index] if CheckWin.check_win(temp_game)
                end
            end
        end
        false
    end
    
    # def self.turn(game_state)
    #     if winning_move(game_state)
    #     [1,1]
    # end
end

