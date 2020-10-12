require_relative "constants"

class GameController
    attr_accessor :input, :verified_move, :game
    def initialize
        @game = Game.new
    end

    def play_move
        @game.add_move(@verified_move[0], @verified_move[1])
    end

    def verify_and_format_move(move)
        verify = VerifyAndConvertInput.new
        @verified_move = verify.take_and_return_user_input(move)
    end



end