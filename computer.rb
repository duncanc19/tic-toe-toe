require_relative "check_win"


class Computer
    def self.turn(game_state)
        top_layer(game_state)
    end

    def self.top_layer(game_state)
        best_move = nil
        best_score = -1

        game_state.each_with_index do |row, row_index|
            row.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.current_player = 'o'
                    temp_game.game_state = game_state.map(&:clone)
                    temp_game.add_move(row_index, col_index)
                    if CheckWin.check_win(temp_game)
                        return [row_index,col_index]
                    else 
                        score = minimum_move(temp_game.game_state) 
                        if score >= best_score
                            best_move = [row_index,col_index]
                            best_score = score
                        end
                    end
                end
            end
        end
        best_move
    end

    def self.maximum_move(game_state)
        maximizer = [] 
        game_state.each_with_index do |row, row_index|
            row.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.current_player = 'o'
                    temp_game.game_state = game_state.map(&:clone)
                    temp_game.add_move(row_index, col_index)
                    if CheckWin.check_win(temp_game)
                        maximizer << 1 
                    elsif CheckDraw.check_draw(temp_game)
                        maximizer << 0 
                    else
                        maximizer << minimum_move(temp_game.game_state)
                    end
                end
            end
        end
        return maximizer.max()
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
                    if CheckWin.check_win(temp_game)
                        minimizer << -1 
                    elsif CheckDraw.check_draw(temp_game)
                        minimizer << 0 
                    else
                        minimizer << maximum_move(temp_game.game_state)
                    end
                end
            end
        end
        return minimizer.min()
    end
end

