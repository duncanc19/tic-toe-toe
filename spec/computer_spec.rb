require_relative '../computer'

context Computer do
    describe ".turn" do
        it "returns a winning move given a winnable game" do
            # Arrange
            game_state = [['o','o',''],['x','x',''],['x','','']]
            # Act
            move = Computer.turn(game_state)
            # Assert
            expect(move).to eq([0,2])
        end
    end
end