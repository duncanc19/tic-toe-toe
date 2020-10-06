require_relative "constants_test"
require_relative "../game_controller"
require_relative "../present"

# When: a new game starts
# Then: display an empty grid
describe 'a new game starts' do
    it 'displays an empty grid on command line' do
        # Arrange
        # game = Game.new
        # presenter = Present.new
        # game_controller

        # Act
        # string = presenter.present_game(game)
        expected_string = "#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Assert
        expect { Present.new }
        .to output(expected_string)
        .to_stdout_from_any_process
    end
end

# Given: a game
# When: the game is started 
# Then: the user is asked for a move
describe "at the start of the game" do 
    it "the user is asked for a move " do 
        # Arrange 
        game_controller = GameController.new
        expected_string = TEST_DEFAULT_INPUT_REQUEST
        #  Assert (Act is in expect)
        expect {  game_controller.ask_user }
        .to output(expected_string)
        .to_stdout_from_any_process

    end 
end


# Given: the player is aked for a move
# When: the player gives a valid move
# Then: the move is accepted
# And: Shown on the board in CL 
describe "the user gives a valid move" do 
    it "the board is updated and shown" do 
        # Arrange 
        present = Present.new
        game_controller = present.game_controller
        allow(game_controller.input).to receive(:gets) {"0,2"}
        game_controller.receive_move
        game_controller.play_move 
        expected_string = "#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        present.create_grid_as_string
        present.output_to_command_line
        #  Assert (Act is in expect)
        expect { present.output_to_command_line }
        .to output(expected_string)
        .to_stdout_from_any_process

    end 
end


# Given: a game that has already commenced
# When: the user is asked for a move
# Then: the updated grid is shown in the command line 


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
describe 'a player makes an valid move' do
    it 'move is shown on the grid' do
        # Arrange
        presenter = Present.new
        game = presenter.game_controller.game
        # Act
        result = game.add_move(0,0)
        display = presenter.create_grid_as_string

        # Assert
        expect(display).to eq("#{TEST_PLAYER1}#{TEST_EMPTY}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}")

    end
end


# Given: a game
# When: the first player makes a move
# Then: the next player is asked for a move
# And: has the symbol 'o'
describe 'the first player makes a move' do
    # it 'the next player is asked for a move' do
    #     # Arrange
    #     game = Game.new

    #     # Act
    #     game.add_move(0,0)
    #     game.next_player
    #     game.player

    #     # Assert
    #     expect(game.player).to eq("o")
    # end
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

# Given: A full grid
# When: there is no winnin move
# Then: its a draw! 
# And: the game is over 

# Given: A grid

# When: a player makes a valid move

# Then: the move is shown on the grid






# Given: A grid
# When: A player makes an winning move
# Then: the player wins
# And: the game is over