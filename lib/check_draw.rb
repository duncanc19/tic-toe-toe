class CheckDraw
    def self.check_draw(game)
        game.game_state.each do |row|
          return false if row.include?("")    
        end
        true
    end 
end