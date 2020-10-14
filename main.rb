Dir["*.rb"].each {|file| require_relative file if file != "main.rb" }
# require_relative "one_turn"


class Main
    def play_game(present, game, turn, get_input)
        # present.output_message_to_command_line_newline(Messages.message_hash(:welcome))
        present.show_grid(game)
        while (!CheckDraw.check_draw(game)) do
            turn.get_valid_move(get_input, game)
            present.show_grid(game)
            break if CheckWin.check_win(game)
            game.next_player
        end
    end
end
present = Present.new
game = Game.new
get_input = GetInput.new
turn = OneTurn.new
main = Main.new

main.play_game(present, game, turn, get_input)
