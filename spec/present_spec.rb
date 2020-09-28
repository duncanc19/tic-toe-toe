require_relative "../present"

context Present do
    describe "When an empty game is passed to Present" do
        it "outputs an empty grid" do 
            # Arrange
            presenter = Present.new
            game = Game.new
            # Act
            display = presenter.present_game(game)
            # Assert
            expect(display).to eq("---\n---\n---")
        end 
    end
    describe 'a player makes an valid move' do
        it 'move is shown on the grid' do
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
end
