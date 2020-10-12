require_relative '../messages'
require_relative 'constants_test'

context Messages do
    describe ".message_hash" do
        it "when given 'welcome' returns standard welcome message" do
            # Act 
            result = Messages.message_hash(:welcome)
            # Assert
            expect(result).to eq(TEST_WELCOME_MESSAGE)
        end
        it "when given 'enter_move' returns standard enter message" do
            # Act 
            result = Messages.message_hash(:enter_move)
            # Assert
            expect(result).to eq(TEST_DEFAULT_INPUT_REQUEST)
        end
        it "when given 'invalid_move' returns standard invalid message" do
            # Act 
            result = Messages.message_hash(:invalid_move)
            # Assert
            expect(result).to eq(TEST_WRONG_INPUT)
        end
        it "when given 'draw' returns standard draw message" do
            # Act 
            result = Messages.message_hash(:draw)
            # Assert
            expect(result).to eq(TEST_DRAW)
        end
    end
    describe ".winning_message" do
        it "when given player1, returns player1 winning message" do
            # Act 
            result = Messages.winning_message(TEST_PLAYER1)
            # Assert
            expect(result).to eq(TEST_PLAYER1_WIN)
        end
        it "when given player2, returns player2 winning message" do
            # Act 
            result = Messages.winning_message(TEST_PLAYER2)
            # Assert
            expect(result).to eq(TEST_PLAYER2_WIN)
        end
    end

    describe ".player_turn_message" do
        it "tells player1 it's their turn" do
           # Act 
           result = Messages.player_turn_message(TEST_PLAYER1)
           # Assert
           expect(result).to eq(TEST_PLAYER1_TURN) 
        end
    end
end