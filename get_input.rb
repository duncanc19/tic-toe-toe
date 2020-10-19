class GetInput
    def get_move
      move = gets
      return move.strip
    end
    def get_game_type
      game_type = gets.chomp
      return "2-player game" if game_type == "1"
      return "computer" if game_type == "2"
    end
end