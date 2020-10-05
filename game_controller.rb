require_relative "constants"

class GameController

    def initialize
        @game = Game.new
        @present = Present.new
        @present.output_to_command_line(@present.present_game(@game))
    end

    def ask_user
        print DEFAULT_INPUT_REQUEST
    end

    def receive_move(input)
        verify = VerifyAndConvertInput.new
        move = input.get_move
        return verify.take_and_return_user_input(move)
    end 
end