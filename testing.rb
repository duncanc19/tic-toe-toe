Dir["*.rb"].each {|file| require_relative file if file != "tic_tac_toe.rb" }

Computer.turn([['','x',''],['o','x','x'],['','o','']])