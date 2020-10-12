Dir["*.rb"].each {|file| require_relative file if file != "main.rb" }
# require_relative "one_turn"


class Main
    def play_game(present, turn)
        present.output_message_to_command_line_newline(Messages.message_hash(:welcome))
        while (!CheckDraw.check_draw(present.game_controller.game)) do
            turn.play_turn(present) 
            break if CheckWin.check_win(present.game_controller.game)
            present.game_controller.game.next_player
        end
    end
end
present = Present.new
turn = OneTurn.new
main = Main.new

main.play_game(present,turn)
