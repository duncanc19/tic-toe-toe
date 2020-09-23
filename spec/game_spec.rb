require_relative "../game"

context Game do
    describe "When a game is initialized" do
        it "contains an empty game_state array (3x3 of empty strings)" do 
            # Arange
            new_game = Game.new
            # Assert
            expect(new_game.game_state).to eq([['','', ''],['','', ''],['','', '']])
        end 
    end
    describe "When a move is added to top left" do 
        it "adds player's symbol to top left" do
            # Arrange
            game = Game.new
            # Act 
            game.add_move(0,0)
            # Assert
            expect(game.game_state).to eq([['x','', ''],['','', ''],['','', '']])
        end 
    end 
end

