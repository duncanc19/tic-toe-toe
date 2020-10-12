class Messages
    def self.message_hash(message_name)
        messages_hash = {
            welcome: "Welcome to SCARY tic tac toe!! 🎃 vs 👻 ",
            invalid_move: "Move invalid - please try again: ",
            enter_move: "Please enter your move: ",
            draw: "😭😭😭 IT'S A DRAW! 😭😭😭"
        }
        messages_hash[message_name]
    end
    def self.winning_message(player)
        "🎉🥳🎉🥳🎉🥳 #{player} WINS! 🎉🥳🎉🥳🎉🥳"
    end
end