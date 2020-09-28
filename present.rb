class Present
    def present_game(game)
        game.game_state.each do |row|
          return "x--\n---\n---" if row.include?('x')
        end
        "---\n---\n---" 
    end 
end 
