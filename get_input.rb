class GetInput

    def get_move
      move = gets
      return move.strip
    end

    def verify_move?(move)
      move.match?(/\A\d\D*\d\z/)
    end 

    def convert_move(move)
      row_number = move.match(/\A(\d)\D*(\d)\z/)[1].to_i
      col_number = move.match(/\A(\d)\D*(\d)\z/)[2].to_i
      [row_number,col_number]
    end 

    def take_and_return_user_input
        verify = false
        
        while verify == false do
          print "Please enter your move: "
          move = get_move
          verify = verify_move?(move)
        end
        convert_move(move)
    end

    
end