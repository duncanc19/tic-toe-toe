class Present
    def present_game(game)
        game.game_state.each do |row|
          return "x--\n---\n---" if row[0] == 'x'
          return "-x-\n---\n---" if row[1] == 'x'
          return "--x\n---\n---" if row[2] == 'x'
        end
        "---\n---\n---" 
    end 
end 
