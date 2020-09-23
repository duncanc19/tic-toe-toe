require_relative "../game"



context Game do
    describe "When a game is initialized" do
        it "contains an empty game_state array (3x3 of empty strings)" do 
            # Act
            new_game = Game.new
            # Assert
            expect(new_game.game_state).to eq([['','', ''],['','', ''],['','', '']])
        end 
    end
end