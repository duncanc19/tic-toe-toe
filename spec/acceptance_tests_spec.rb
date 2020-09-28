# When: a new game starts
# Then: display an empty grid
describe 'a new game starts' do
    it 'displays an empty grid' do
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
    xit 'move is shown on the grid' do
        # Arrange
        game = Game.new
        presenter = Present.new

        # Act
        result = game.add_move(0,0)
        display = presenter.present_game(game)

        # Assert
        expect(display).to eq("x--\n---\n---")

    end
end





# Given: A grid

# When: a player makes a valid move

# Then: the move is shown on the grid



# Given: A grid

# When: A player makes an winning move

# Then: the player wins

# And: the game is over