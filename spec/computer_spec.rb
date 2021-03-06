require_relative '../lib/computer'

context Computer do
    describe ".maximum_move" do
        context "one move away from winning" do
            it "returns 1 when given a winnable game" do
                # Arrange
                game_state = [['o','o',''],['x','x',''],['x','','']]
                # Act
                move = Computer.maximum_move(game_state)
                # Assert
                expect(move).to eq(1)
            end
            it "returns 1 when given a winnable game" do
                # Arrange
                game_state = [['','','x'],['x','o',''],['x','','o']]
                # Act
                move = Computer.maximum_move(game_state)
                # Assert
                expect(move).to eq(1)
            end
        end
        context "two moves away from winning" do
            it "returns 1" do
                # Arrange
                game_state = [['x','',''],['x','',''],['o','o','x']]
                # Act
                move = Computer.maximum_move(game_state)
                # Assert
                expect(move).to eq(1)
            end
            it "returns 1" do
                # Arrange
                game_state = [['','x',''],['o','x','x'],['','o','']]
                # Act
                move = Computer.maximum_move(game_state)
                # Assert
                expect(move).to eq(1)
            end
        end
    end

    describe ".minimum_move" do
        context "one move away from player winning" do
            it "returns -1 when given a winnable game" do
                # Arrange
                game_state = [['x','x',''],['o','o',''],['o','','']]
                # Act
                move = Computer.minimum_move(game_state)
                # Assert
                expect(move).to eq(-1)
            end
            it "returns -1 when given a winnable game" do
                # Arrange
                game_state = [['','','o'],['o','x',''],['o','','x']]
                # Act
                move = Computer.minimum_move(game_state)
                # Assert
                expect(move).to eq(-1)
            end
        end 
        context "two moves away from player winning" do
            it "returns -1" do
                # Arrange
                game_state = [['o','',''],['o','',''],['x','x','o']]
                # Act
                move = Computer.minimum_move(game_state)
                # Assert
                expect(move).to eq(-1)
            end
            it "returns 1" do
                # Arrange
                game_state = [['','o',''],['x','o','o'],['','x','']]
                # Act
                move = Computer.minimum_move(game_state)
                # Assert
                expect(move).to eq(-1)
            end
        end
        context "one move away from drawing game" do
            it "returns 0 when given a drawable game" do
                # Arrange
                game_state = [['o','x','o'],['o','x','x'],['x','o','']]
                # Act
                move = Computer.minimum_move(game_state)
                # Assert
                expect(move).to eq(0)
            end
        end
    end

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
  
        context "two moves away from winning" do
            it "returns the best move[1,1]" do
                # Arrange
                game_state = [['x','',''],['x','',''],['o','o','x']]
                # Act
                move = Computer.turn(game_state)
                # Assert
                expect(move).to eq([1,1])
            end
            it "returns the best move[2,0]" do
                # Arrange
                game_state = [['','x',''],['o','x','x'],['','o','']]
                # Act
                move = Computer.turn(game_state)
                # Assert
                expect(move).to eq([2,0])
            end
        end
    end
end