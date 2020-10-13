require_relative "constants_test"
require_relative "../game"
require_relative "../present"

# ********************************** BAD TEST ********************************
# require_relative "../main"
# ********************************** BAD TEST ********************************

# When: a new game starts
# Then: display an empty grid
describe 'a new game starts' do
    it 'displays an empty grid on command line' do
        # Arrange
        presenter = Present.new
        game = Game.new

        # Act
        expected_string = "#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Assert
        expect { presenter.show_grid(game) }
        .to output(expected_string)
        .to_stdout_from_any_process
    end
end

# Given: a game
# When: the game is started 
# Then: the user is asked for a move



# Given: A grid
# When: A player makes an invalid move
# Then: the move is rejected
# And: the player is asked for another move
describe 'a player makes an invalid move' do
    it 'rejects the move' do
        # Arrange
        game = Game.new

        # Act
        result = game.add_move(6,6)

        # Assert
        expect(result).to eq(false)
    end
end

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
        turn = OneTurn.new
        get_input = GetInput.new
        allow(get_input).to receive(:gets) {"0,2"}
        expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Act 
        turn.get_valid_move(get_input, game)
        # Assert
        expect { present.show_grid(game) }
        .to output(expected_string)
        .to_stdout_from_any_process
    end
end
describe "the user gives invalid moves" do
    it "receives an invalid(wrong format) move, then a valid move so shows valid move on the board" do
        # Arrange 
        game = Game.new
        present = Present.new
        get_input = GetInput.new
        turn = OneTurn.new
        allow(get_input).to receive(:gets).and_return("blah", "0,2")
        expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Act 
        turn.get_valid_move(get_input, game)
        # Assert (in {})
        expect { present.show_grid(game) }
        .to output(expected_string)
        .to_stdout_from_any_process
    end

    it "receives an invalid(game rules) move, then a valid move so shows valid move on the board" do
        # Arrange 
        game = Game.new
        present = Present.new
        get_input = GetInput.new
        turn = OneTurn.new
        allow(get_input).to receive(:gets).and_return("0,8", "0,2")
        expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Act 
        turn.get_valid_move(get_input, game)
        # Assert (in {})
        expect { present.show_grid(game) }
        .to output(expected_string)
        .to_stdout_from_any_process
    end
    it "receives both types of invalid move, then a valid move so shows valid move on the board" do
        # Arrange 
        game = Game.new
        present = Present.new
        get_input = GetInput.new
        turn = OneTurn.new
        allow(get_input).to receive(:gets).and_return("blah","0,8", "0,2")
        expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Act 
        turn.get_valid_move(get_input, game)
        # Assert (in {})
        expect { present.show_grid(game) }
        .to output(expected_string)
        .to_stdout_from_any_process
    end
end

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