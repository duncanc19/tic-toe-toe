class GetInput

    def get_move
      move = gets.chomp
      return move
    end

    def verify_move(move)
      return true if move == "2,2"
      return true if move == "0,2"
      false
    end 
end