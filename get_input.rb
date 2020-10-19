class GetInput
    def get_move
      move = gets
      return move.strip
    end
    def get_game_type
      game_type = gets.chomp
      return :two_player_game if game_type == "1"
      return :computer_game if game_type == "2"
      false
    end
end