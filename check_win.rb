class CheckWin
    def self.check_win(game)
      return true if check_diagonals(game)
      return true if check_rows(game)
      return true if check_columns(game)
      false
    end 


    def self.check_rows(game)
        game.game_state.each do |row|
          return true if row.count(game.current_player) == 3
        end
        false 
    end 


    def self.check_columns(game)
        3.times do |i|
            return true if game.game_state[0][i] == game.current_player \
                        && game.game_state[1][i] == game.current_player \
                        && game.game_state[2][i] == game.current_player 
        end             
        false
    end 


    def self.check_diagonals(game)
        return true if game.game_state[0][0] == game.current_player \
                    && game.game_state[1][1] == game.current_player \
                    && game.game_state[2][2] == game.current_player 
        return true if game.game_state[2][0] == game.current_player \
                    && game.game_state[1][1] == game.current_player \
                    && game.game_state[0][2] == game.current_player 
        false
    end 
end 