require_relative '../computer'

context Computer do
    describe ".turn" do
        context "one move away from winning" do
            it "returns a winning move [0,2] given a winnable game" do
                # Arrange
                game_state = [['o','o',''],['x','x',''],['x','','']]
                # Act
                move = Computer.turn(game_state)
                # Assert
                expect(move).to eq([0,2])
            end
            it "returns a winning move [0,0] given a winnable game" do
                # Arrange
                game_state = [['','','x'],['x','o',''],['x','','o']]
                # Act
                move = Computer.turn(game_state)
                # Assert
                expect(move).to eq([0,0])
            end
        end 
        describe "two moves away from winnning" do
            it "returns the best move[1,1]" do
                # Arrange
                game_state = [['x','',''],['x','',''],['o','o','x']]
                # Act
                move = Computer.turn(game_state)
                # Assert
                expect(move).to eq([1,1])
            end
        end
    end
end