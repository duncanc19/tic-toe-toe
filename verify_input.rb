class VerifyAndConvertInput 


    def verify_move?(move)
        move.match?(/\A\d\D*\d\z/)
    end 

    def convert_move(move)
        row_number = move.match(/\A(\d)\D*(\d)\z/)[1].to_i
        col_number = move.match(/\A(\d)\D*(\d)\z/)[2].to_i
        [row_number,col_number]
    end 

    def take_and_return_user_input(move)
        return false if !verify_move?(move) 
        convert_move(move)
    end

    def out_of_grid?(move)
        return true if move[0]> 2 || move[1] > 2
        false
    end

    def space_taken?(move, game_state)
        false
    end


    # def invalid_move?(row,col)
    #     return true if row > 2 || col > 2
    #     return true if @game_state[row][col] == 'o' || @game_state[row][col] == 'x' 
    #     false
    #  end
    def get_valid_move(get_input, game)
        valid_move = false
        while !valid_move
            valid_move = get_correct_format_input(get_input, game)
            valid_move = game.play_move
        end 
    end
    
    def get_correct_format_input(get_input, game)
        move = false
        while !move do
            move = get_input.get_move
            move = game.verify_and_format_move(move)
        end
    end

end 