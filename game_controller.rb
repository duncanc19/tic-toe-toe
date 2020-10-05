require_relative "constants"

class GameController
    attr_accessor :input, :verified_move
    def initialize
        @game = Game.new
        @present = Present.new
        @present.output_to_command_line(@present.present_game(@game))
        @input = GetInput.new
    end

    def ask_user
        print DEFAULT_INPUT_REQUEST
    end

    def receive_move
        verify = VerifyAndConvertInput.new
        move = @input.get_move
        @verified_move = verify.take_and_return_user_input(move)
    end 

    def play_move
        @game.add_move(@verified_move[0], @verified_move[1])
    end

end