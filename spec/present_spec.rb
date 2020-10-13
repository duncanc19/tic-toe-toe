require_relative "../present"
require_relative "constants_test"

context Present do
    describe "When an empty game is passed to Present" do
        it "outputs an empty grid" do 
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            
            # Act
            display = presenter.create_grid_as_string(game_controller)
            # Assert
            expect(display).to eq("#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}")
        end 
    end
    describe 'a player makes an valid move' do
        it 'move is shown on the grid first row [0,0]' do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            result = game.add_move(0,0)
            display = presenter.create_grid_as_string(game_controller)
            
            # Assert
            expect(display).to eq("#{TEST_PLAYER1}#{TEST_EMPTY}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}")
        end
        it 'move is shown on the grid first row [0,2]' do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            result = game.add_move(0,2)
            display = presenter.create_grid_as_string(game_controller)
            
            # Assert
            expect(display).to eq("#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}")
        end
        it 'move is shown on the grid first row[0,1]' do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            result = game.add_move(0,1)
            display = presenter.create_grid_as_string(game_controller)
            
            # Assert
            expect(display).to eq("#{TEST_EMPTY}#{TEST_PLAYER1}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}\n#{TEST_THREE_EMPTY}")
        end
        it 'move is shown on the grid second row [1,1]' do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            result = game.add_move(1,1)
            display = presenter.create_grid_as_string(game_controller)            
            # Assert
            expect(display).to eq("#{TEST_THREE_EMPTY}\n#{TEST_EMPTY}#{TEST_PLAYER1}#{TEST_EMPTY}\n#{TEST_THREE_EMPTY}")
        end
        it 'move is shown on the grid second row [1,2]' do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            result = game.add_move(1,2)
            display = presenter.create_grid_as_string(game_controller)            
            # Assert
            expect(display).to eq("#{TEST_THREE_EMPTY}\n#{TEST_EMPTY}#{TEST_EMPTY}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}")
        end
    end
    describe 'two moves can be presented' do
        it "shows two x's if player isnt changed" do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            game.add_move(1,2)
            game.add_move(1,1)
            display = presenter.create_grid_as_string(game_controller)            
            # Assert
            expect(display).to eq("#{TEST_THREE_EMPTY}\n#{TEST_EMPTY}#{TEST_PLAYER1}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}")
        end 
        it "shows one x and one o if player is changed" do
            # Arrange
            presenter = Present.new
            game_controller = GameController.new
            game = game_controller.game
            # Act
            game.add_move(1,2)
            game.next_player
            game.add_move(1,1)
            display = presenter.create_grid_as_string(game_controller)            
            # Assert
            expect(display).to eq("#{TEST_THREE_EMPTY}\n#{TEST_EMPTY}#{TEST_PLAYER2}#{TEST_PLAYER1}\n#{TEST_THREE_EMPTY}")
        end 
    end 

end

# describe "#verify_and_format_move" do
#       it "returns false when given empty string" do
#         # Arrange
#         game_controller = GameController.new
#         # Act
#         allow(game_controller.input).to receive(:gets) {"\n"}
#         result = game_controller.receive_move
#         # Assert  
#         expect(result).to eq(false)  
#       end
#       it "returns array when given valid move" do
#         # Arrange
#         game_controller = GameController.new
#         # Act
#         allow(game_controller.input).to receive(:gets) {"0,2\n"}
#         result = game_controller.receive_move
#         # Assert  
#         expect(result).to eq([0,2])  
#       end
#     end
