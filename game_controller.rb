class GameController

    def initialize
        @game = Game.new
        @present = Present.new
        @present.output_to_command_line(@present.present_game(@game))
    end

    def ask_user
        print "Please enter your move: "
    end
end