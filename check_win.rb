class CheckWin
    def self.check_rows(game)
        game.game_state.each do |row|
          return true if row.count('x') == 3
        end
        
        false 
    end 
end 