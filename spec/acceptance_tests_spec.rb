require_relative "constants_test"

# When: a new game starts
# Then: display an empty grid
describe 'a new game starts' do
    it 'displays an empty grid on command line' do
        # Arrange
        game = Game.new
        presenter = Present.new

        # Act
        string = presenter.present_game(game)
        expected_string = "#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n"
        # Assert
        expect { presenter.output_to_command_line(string) }
        .to output(expected_string)
        .to_stdout_from_any_process
    end
end



# it "returns a valid move" do
#     # Arrange  
#     get_input = GetInput.new
#     allow(get_input).to receive(:gets) {"2 ,2"}
#     # Act
#     result = get_input.take_and_return_user_input
#     # Assert 
#     expect(result).to eq([2,2])
#   end

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
        game = Game.new
        presenter = Present.new

        # Act
        result = game.add_move(0,0)
        display = presenter.present_game(game)

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