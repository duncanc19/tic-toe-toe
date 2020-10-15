class VerifyAndConvertInput 

    def verify_and_convert_move(move, game_state)
        return false if !correct_format?(move) 
        converted_move = convert_move(move)
        return false if out_of_grid?(converted_move)
        return false if space_taken?(converted_move, game_state)
        converted_move
    end

    def correct_format?(move)
        move.match?(/\A\d\D*\d\z/)
    end 

    def convert_move(move)
        row_number = move.match(/\A(\d)\D*(\d)\z/)[1].to_i
        col_number = move.match(/\A(\d)\D*(\d)\z/)[2].to_i
        [row_number,col_number]
    end 

    def out_of_grid?(move)
        return true if move[0]> 2 || move[1] > 2
        false
    end

    def space_taken?(move, game_state)
        row = move[0]
        col = move[1]
        return true if game_state[row][col] == 'o' || game_state[row][col] == 'x' 
        false
    end

end 