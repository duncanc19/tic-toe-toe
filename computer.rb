class Computer
    def self.turn(game_state)
        game_state.each_with_index do |row, row_index|
            three_square.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.game_state = game_state
                    temp_game.add_move(row_index, col_index)
                    return [row_index,col_index] if CheckWin.check_win(temp_game)
                end
            end
        end
    end
end