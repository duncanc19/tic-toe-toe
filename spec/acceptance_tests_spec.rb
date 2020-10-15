require_relative "constants_test"
require_relative "../game"
require_relative "../present"
require_relative "../main"

describe "tic tac toe game" do 
    before(:each) do
        @main = Main.new
        @game = Game.new
        @present = Present.new
        @get_input = GetInput.new
        @verify = VerifyAndConvertInput.new
    end

    describe "the user quits the game early" do
        it "shows end game message user types 'quit'" do
            # Arrange 
            expected_string = /Game has ended/
            allow(@get_input).to receive(:gets).and_return("quit")
            # Act 
            
            # Assert (in {})
            expect {@main.play_game(@present, @game, @verify, @get_input)}
            .to output(expected_string)
            .to_stdout_from_any_process 
        end
    end

    # When: a new game starts
    # Then: display welcome message
    # And: display an empty grid
    describe 'a new game starts' do
        it 'displays an empty grid on command line' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("quit")
            # Act
            empty_grid_string = "#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            welcome_message_string=TEST_WELCOME_MESSAGE 
            # Assert
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(empty_grid_string))
            .to_stdout_from_any_process
            
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(welcome_message_string))
            .to_stdout_from_any_process

        end
    end

    # When: A game has started 
    # Then: the player is asked for a move
    describe 'when game is started' do
        it 'asks user for a move' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("quit")
            expected_string = TEST_DEFAULT_INPUT_REQUEST
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: A grid
    # When: A player makes an valid move
    # Then: the move is shown on the grid 
    describe 'a player makes a valid move' do
        it 'move is shown on the grid' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("0,0", "quit")
            expected_string = "#{TEST_PLAYER1}#{TEST_EMPTY}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: A grid
    # When: A player makes an invalid move
    # Then: the move is rejected
    # And: the player is asked for another move
    describe 'a player makes an invalid move' do
        it 'shows invalid_move message' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("0,6", "quit")
            expected_string = TEST_WRONG_INPUT
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end



    describe "whose turn it is" do
    # Given: a new game
    # When: the game starts 
    # Then: who's turn it is is shown
        it 'it shows players turn before asking for input' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("quit")
            expected_string = TEST_PLAYER1_TURN
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end

    # Given: an ongoing game
    # When: player 1 has played a move
    # Then: player 2 is asked for a move
        it 'it shows players turn before asking for input' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("0,2","quit")
            expected_string = TEST_PLAYER2_TURN
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    describe "the user gives an invalid move then a valid move" do
        it "shows valid move on the board" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("blah", "0,2", "quit")
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: an ongoing game
    # When: several moves are played
    # Then: The board is updated and shown
    describe "players give several moves" do
        it "displays the updated board" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return( "0,2", "0 0", "1 2", "2 2", "quit")
            expected_string =   "#{TEST_PLAYER2}#{TEST_EMPTY}#{TEST_PLAYER1}\n"\
                                "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n"\
                                "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER2}\n"
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: an ongoing game
    # When: player 1 makes a winning move
    # Then: The player 1 win message is shown
    # And: game ends
    describe "a player makes a winning move" do
        it "shows player 1 win message" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("00", "10", "01", "11", "02")
            expected_string = TEST_PLAYER1_WIN
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end

        it "shows player 2 win message" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("00", "10", "01", "11", "22", "12")
            expected_string = TEST_PLAYER2_WIN
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: an ongoing game
    # When: the final possible move is played and is not a win
    # Then: The draw message is shown
    # And: Game ends
    describe "it's a draw" do
        it "shows the draw message" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("11", "00", "02", "20", "10", "12", "01", "21", "22")
            expected_string = TEST_DRAW
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end


















    # # Given: A new game starts 
    # # When: a user gives several moves 
    # # Then: the board is output each time
    # describe "a user gives several moves" do 
    #     it "displays the board after each move" do
    #         # Arrange 
            
    #         allow(@get_input).to receive(:gets).and_return("quit")
    #         # Act 
            
    #         # Assert (in {})
    #         expect {@main.play_game(@present, @game, @verify, @get_input)}
    #         .to output(expected_string)
    #         .to_stdout_from_any_process 
    #     end
    # end
        
    # ********************************** BAD TEST ********************************

    # # Given: A new game starts 
    # # When: a user gives several moves 
    # # Then: the board is output each time
    # describe "a user gives several moves" do 
    #     it "displays the board after each move" do
    #         # Arrange
    #         present = Present.new
    #         turn = OneTurn.new
    #         main = Main.new(present, turn)
    #         allow(turn.play_turn).should_receive(:gets).and_return("0 1","1 0","0 2", "1 1", "0 0")
    #         expected_string = "#{TEST_PLAYER1}#{TEST_PLAYER1}#{TEST_PLAYER1}\n#{TEST_PLAYER2}#{TEST_PLAYER2}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            
    #         # Act
    #         main.play_game
    #         # Assert
    #         expect { present.output_to_command_line }
    #         .to output(expected_string)
    #         .to_stdout_from_any_process
    #     end
    # end
    # ********************************** BAD TEST ********************************

    # Given: A full grid
    # When: there is no winning move
    # Then: its a draw! 
    # And: the game is over 

    # Given: A grid
    # When: a player makes a valid move
    # Then: the move is shown on the grid



    # Given: A grid
    # When: A player makes an winning move
    # Then: the player wins
    # And: the game is over
end