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

    describe "When a move is added to empty grid" do 
        test_hash = {
            top_left: [0,0,[['x','', ''],['','', ''],['','', '']]],
            top_right: [0,2,[['','', 'x'],['','', ''],['','', '']]],
            middle_middle: [1,1,[['','', ''],['','x', ''],['','', '']]],
            bottom_right: [2,2,[['','', ''],['','', ''],['','', 'x']]]
        }
        test_hash.each do |key,value|
            it "adds players symbol to #{key}" do

                # Arrange
                game = Game.new
                # Act 
                game.add_move(value[0],value[1])
                # Assert
                expect(game.game_state).to eq(value[2])
            end 
        end
    end

end

