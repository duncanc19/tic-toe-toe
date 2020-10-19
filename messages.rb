class Messages
    def self.message_hash(message_name)
        messages_hash = {
            welcome: "Welcome to SCARY tic tac toe!! 🎃 vs 👻 ",
            invalid_move: "Move invalid - please try again: ",
            enter_move: "Please enter your move: ",
            draw: "😭😭😭 IT'S A DRAW! 😭😭😭",
            game_ended: "Game has ended 😦",
            select_game: "Choose game type: \n1 - two player game\n2 - play against computer",
            two_player_game: "You've selected a two player game!",
            computer_game: "You've selected to play against the computer - good luck!",
            invalid_game_type: "The game type you entered was invalid, please enter 1 or 2"
        }
        messages_hash[message_name]
    end
    def self.winning_message(player)
        "🎉🥳🎉🥳🎉🥳 #{player} WINS! 🎉🥳🎉🥳🎉🥳"
    end
    def self.player_turn_message(player) 
        "It's #{player}'s turn! "
    end
end