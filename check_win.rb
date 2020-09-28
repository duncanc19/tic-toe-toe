class CheckWin
    def self.check_rows(game)
        game.game_state.each do |row|
          return true if row.count(game.current_player) == 3
        end
        false 
    end 
    def self.check_columns(game)
        return true if game.game_state[0][0] == 'x' \
                    && game.game_state[1][0] == 'x' \
                    && game.game_state[2][0] == 'x' 
        false
    end 
end 