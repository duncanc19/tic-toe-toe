require_relative "constants_test"
require_relative "../game"
require_relative "../present"
require_relative "../main"
require_relative "../computer"

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
            expected_string = TEST_GAME_ENDED
            allow(@get_input).to receive(:gets).and_return("1", "quit")
            # Act 
            
            # Assert (in {})
            expect {@main.play_game(@present, @game, @verify, @get_input)}
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process 
        end
    end

    # When: a new game starts
    # Then: display welcome message
    # And: display an empty grid
    describe 'a new game starts' do
        it 'displays an empty grid on command line' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("1", "quit")
            # Act
            empty_grid_string = "#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Assert
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(empty_grid_string))
            .to_stdout_from_any_process
        end

        it 'displays welcome message on command line' do
            # Arrange
            allow(@get_input).to receive(:gets).and_return("1", "quit")
            # Act
            welcome_message_string=TEST_WELCOME_MESSAGE 
            # Assert
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
            allow(@get_input).to receive(:gets).and_return("1", "quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "0,0", "quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "0,6", "quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "0,2","quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "blah", "0,2", "quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "0,2", "0 0", "1 2", "2 2", "quit")
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
            allow(@get_input).to receive(:gets).and_return("1", "00", "10", "01", "11", "02")
            expected_string = TEST_PLAYER1_WIN
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end

        it "shows player 2 win message" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("1", "00", "10", "01", "11", "22", "12")
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
            allow(@get_input).to receive(:gets).and_return("1", "11", "00", "02", "20", "10", "12", "01", "21", "22")
            expected_string = TEST_DRAW
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: A winning game
    # Then: The draw message is not shown
    describe "somebody wins " do
        it "it doesnt show the draw message" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("1", "00", "10", "01", "11", "22", "12")
            expected_string = TEST_DRAW
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .not_to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: A new game 
    # Then: the player is asked to choose 2 player or vs computer
    describe "a game starts" do
        it "shows message for selection of 2 player or computer game" do 
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("1", "quit")
            expected_string = TEST_SELECT_GAME_TYPE

            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
  
        it "gets input for selection of 2 player" do 
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("1", "quit")
            expected_string = TEST_2_PLAYER_GAME_SELECTED

            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
        it "gets input for selection of computer game" do 
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("2", "quit")
            expected_string = TEST_COMPUTER_GAME_SELECTED

            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
        it "gets input for selection of computer game after bad inputs" do 
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("5", "2", "quit")
            expected_string = TEST_COMPUTER_GAME_SELECTED

            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
        it "shows bad game type message when given invalid game type" do 
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("5", "2", "quit")
            expected_string = TEST_INVALID_GAME_TYPE

            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        
        end
    end

    # Given: A computer game is selected
    # Then: The second move is played by computer
    describe "computer game is selected" do
        it "displays a second move played by computer" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("2", "00", "quit")
            expected_string = "#{TEST_PLAYER1}#{TEST_EMPTY}#{TEST_EMPTY}\n#{TEST_EMPTY}#{TEST_PLAYER2}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end

    # Given: A computer game is selected
    # Then: A Game can be played and the computer draws
    describe "A computer game is selected" do
        it "the game can be played and the computer draws" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("2", "11", "01", "20", "12", "00")
            expected_string = TEST_DRAW
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end
    # Given: A computer game is selected
    # Then: A Game can be played and the computer wins
    describe "A computer game is selected" do
        it "the game can be played and the computer wins" do
            # Arrange 
            allow(@get_input).to receive(:gets).and_return("2","00", "22", "02")
            expected_string = TEST_PLAYER2_WIN
            # Assert (Act in {})
            expect { @main.play_game(@present, @game, @verify, @get_input) }
            .to output(a_string_including(expected_string))
            .to_stdout_from_any_process
        end
    end
end