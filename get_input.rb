class GetInput

    def get_move
      move = gets.chomp
      return move
    end

    def verify_move(move)
      move.match?(/\A\d\D*\d\z/)
    end 

    def convert_move(move)
      return [1,2] if move == "1,2"
      [0,5]
    end 
end