class CheckDraw
    def self.check_draw(game)
        return true if game.game_state == [['x','x','o'],['o','o','x'],['x','o','x']]
        return true if game.game_state == [['o','x','o'],['o','o','x'],['x','o','x']]
        false
    end 
end