Dir["*.rb"].each {|file| require_relative file if file != "tic_tac_toe.rb" }

# This is where the game is run!

main = Main.new
present = Present.new
game = Game.new
get_input = GetInput.new
verify = VerifyAndConvertInput.new

main.play_game(present, game, verify, get_input)