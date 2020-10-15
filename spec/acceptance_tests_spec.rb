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

    # Given: a game
    # When: the game is started 
    # Then: the welcome message is shown
    # And: the empty grid




    # Given: A grid
    # When: A player makes an invalid move
    # Then: the move is rejected
    # And: the player is asked for another move


    # Given: A grid
    # When: A player makes an valid move
    # Then: the move is shown on the grid 
    describe 'a player makes a valid move' do
        it 'move is shown on the grid' do
            # Arrange
            presenter = Present.new
            game = Game.new
            # Act
            result = game.add_move(0,0)
            expected_string = "#{TEST_PLAYER1}#{TEST_EMPTY}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Assert
            expect { presenter.show_grid(game) }
            .to output(expected_string)
            .to_stdout_from_any_process
        end
    end


    # Given: a game
    # When: the first player makes a move
    # Then: the next player is asked for a move
    # And: has the symbol 'o'
    describe 'after first player turn, current player becomes second player ' do
        it 'has the symbol "o"' do
            # Arrange
            game = Game.new

            # Act
            game.add_move(0,0)
            game.next_player

            # Assert
            expect(game.current_player).to eq("o")
        end
    end

    # Given: the player is aked for a move
    # When: the player gives a valid move
    # Then: the move is accepted
    # And: Shown on the board in CL 
    describe "the user gives a valid move" do 
        it "the board is updated and shown" do 
            # Arrange 
            game = Game.new
            present = Present.new
            get_input = GetInput.new
            verify = VerifyAndConvertInput.new
            allow(get_input).to receive(:gets) {"0,2"}
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Act 
            move = get_input.get_move
            converted_move = verify.verify_and_convert_move(move, game.game_state)
            game.add_move(converted_move[0], converted_move[1])
            # Assert
            expect { present.show_grid(game) }
            .to output(expected_string)
            .to_stdout_from_any_process
        end
    end
    describe "the user gives invalid moves" do
        it "receives an invalid(wrong format) move, then a valid move so shows valid move on the board" do
            # Arrange 
            main = Main.new
            game = Game.new
            present = Present.new
            get_input = GetInput.new
            verify = VerifyAndConvertInput.new
            allow(get_input).to receive(:gets).and_return("blah", "0,2")
            expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
            # Act 
            main.turn(get_input, verify, game)
            # Assert (in {})
            expect { present.show_grid(game) }
            .to output(expected_string)
            .to_stdout_from_any_process
        end
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
        # it "receives an invalid(game rules) move, then a valid move so shows valid move on the board" do
        #     # Arrange 
        #     game = Game.new
        #     present = Present.new
        #     get_input = GetInput.new
        #     verify = VerifyAndConvertInput.new
        #     allow(get_input).to receive(:gets).and_return("0,8", "0,2")
        #     expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        #     # Act 
        #     verify.get_valid_move(get_input, game)
        #     # Assert (in {})
        #     expect { present.show_grid(game) }
        #     .to output(expected_string)
        #     .to_stdout_from_any_process
        # end
        # it "receives both types of invalid move, then a valid move so shows valid move on the board" do
        #     # Arrange 
        #     game = Game.new
        #     present = Present.new
        #     get_input = GetInput.new
        #     verify = VerifyAndConvertInput.new
        #     allow(get_input).to receive(:gets).and_return("blah","0,8", "0,2")
        #     expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        #     # Act 
        #     verify.get_valid_move(get_input, game)
        #     # Assert (in {})
        #     expect { present.show_grid(game) }
        #     .to output(expected_string)
        #     .to_stdout_from_any_process
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