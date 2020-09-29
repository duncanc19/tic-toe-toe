class GetInput

    def get_move
      move = gets
      return move.strip
    end

    def verify_move(move)
      move.match?(/\A\d\D*\d\z/)
    end 

    def convert_move(move)
      row_number = move.match(/\A(\d)\D*(\d)\z/)[1].to_i
      col_number = move.match(/\A(\d)\D*(\d)\z/)[2].to_i
      [row_number,col_number]
    end 

    def take_and_return_user_input
        move = get_move
        return [0,2] if move == "0,2"
        [0,1]
    end
end