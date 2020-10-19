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
    
    def self.turn(game_state)
        if !winning_move(game_state)
            minimum_move(game_state)
        end
        [1,1]
    end

    def self.maximum_move(game_state)
        game_state.each_with_index do |row, row_index|
            row.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.current_player = 'o'
                    temp_game.game_state = game_state.map(&:clone)
                    temp_game.add_move(row_index, col_index)
                    return [row_index,col_index] if CheckWin.check_win(temp_game)
                    minimum_move(temp_game.game_state)
                end
            end
        end
    end

    def self.minimum_move(game_state)
        minimizer = []
        game_state.each_with_index do |row, row_index|
            row.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.current_player = 'x'
                    temp_game.game_state = game_state.map(&:clone)
                    temp_game.add_move(row_index, col_index)
                    minimizer << -1 if CheckWin(temp_game)
                    maximum_move()
                end
            end
        end
    end
end

