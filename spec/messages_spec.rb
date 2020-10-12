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
    end
    describe ".winning_message" do
        it "when given player1, returns player1 winning message" do
            # Act 
            result = Messages.winning_message(TEST_PLAYER1)
            # Assert
            expect(result).to eq(TEST_PLAYER1_WIN)
        end
    end
end