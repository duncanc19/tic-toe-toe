class Computer
    def self.turn(game_state)
        winning_hash = Hash.new
        game_state.each_with_index do |row, row_index|
            row.each_with_index do |square, col_index| 
                if square == ''
                    temp_game = Game.new
                    temp_game.current_player = 'o'
                    temp_game.game_state = game_state.map(&:clone)
                    temp_game.add_move(row_index, col_index)
                    if CheckWin.check_win(temp_game)
                        return [row_index,col_index] 
                        print  [row_index,col_index] 
                    else 
                        winning_hash[[row_index,col_index]] = minimum_move(temp_game.game_state)
                        print "top row: #{[row_index,col_index]}, score: #{winning_hash[[row_index,col_index]]}\n" 
                    end
                end
            end
        end
        print "\n\n"
        winning_hash.max_by{|key,value| value}[0]
        print "#{winning_hash.max_by{|key,value| value}[0]} \n"
        #  "WINNING MOVE: #{winning_hash.max()[0]}"
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
                        print "maximize row: #{[row_index,col_index]}, score: #{1}\n"
                    elsif CheckDraw.check_draw(temp_game)
                        maximizer << 0
                        print "maximize row: #{[row_index,col_index]}, score: #{0}\n" 
                    else
                        maximizer << minimum_move(temp_game.game_state)
                        print "maximize row: #{[row_index,col_index]}, score: #{minimum_move(temp_game.game_state)}\n" 
                    end
                end
            end
        end
        print "\n\n"
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
                        print "minimize row: #{[row_index,col_index]}, score: #{-1}\n"
                    elsif CheckDraw.check_draw(temp_game)
                        minimizer << 0
                        print "minimize row: #{[row_index,col_index]}, score: #{0}\n"
                    else
                        minimizer << maximum_move(temp_game.game_state)
                        print "minimize row: #{[row_index,col_index]}, score: #{maximum_move(temp_game.game_state)}\n"
                    end
                end
            end
        end
        print "\n\n"
        return minimizer.min()
    end
end

