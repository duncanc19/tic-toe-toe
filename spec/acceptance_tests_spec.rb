# When: a new game starts
# Then: display an empty grid
describe 'a new game starts' do
    xit 'displays an empty grid' do
        # Arrange
        game = Game.new
        presenter = Present.new

        # Act
        display = presenter.present_game(game)
        # Assert
        expect(display).to eq("---\n---\n---")
    end
end




# Given: A grid
# When: A player makes an invalid move
# Then: the move is rejected
# And: the player is asked for another move



# Given: A grid

# When: a player makes a valid move

# Then: the move is shown on the grid



# Given: A grid

# When: A player makes an winning move

# Then: the player wins

# And: the game is over