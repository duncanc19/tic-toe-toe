require_relative "../game"

context Game do
    describe "When a game is initialized" do
        it "contains an empty game_state array (3x3 of empty strings)" do 
            # Arrange
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
    describe "when row is out of bounds" do
        it "returns false" do 
            # Arrange
            game = Game.new
            # Act
            result = game.add_move(6,0)
            # Assert
            expect(result).to eq(false)
        end 
    end
    describe "when column is out of bounds" do
        it "returns false" do 
            # Arrange
            game = Game.new
            # Act
            result = game.add_move(0,3)
            # Assert
            expect(result).to eq(false)
        end 
    end

    cell_occupied_hash = {
            top_left: [0,0],
            middle_left: [0,2]
    }

    cell_occupied_hash.each do |key, value|
        describe "when #{key} cell is already occupied" do
          it "returns false" do
            # Arrange
            game = Game.new
            game.add_move(value[0], value[1])
            # Act
            result = game.add_move(value[0],value[1])
            # Assert
            expect(result).to eq(false)
          end
        end
    end

    describe "second player makes move" do
      it "adds 'o' to game state" do
        # Arrange
        game = Game.new
        game.add_move(0,0)
        game.next_player
        # Act
        game.add_move(0,1)
        # Assert
        expect(game.game_state[0][1]).to eq('o')
      end
    end

    describe "invalid move when occupied with 'o'" do
      it "returns false" do
        # Arrange
        game = Game.new
        game.add_move(0,0)
        game.next_player
        game.add_move(0,1)
        game.next_player
        # Act
        result = game.add_move(0,1)
        # Assert
        expect(result).to eq(false)
      end
    end



    describe "#next_player" do
      it "first current player is 'x'" do
        # Arrange
        game = Game.new
        #Assert
        expect(game.current_player).to eq('x')
      end 

      it "changes current player from 'x' to 'o'" do
        # Arrange
        game = Game.new
        game.next_player
        #Assert
        expect(game.current_player).to eq('o')
      end 

      it "changes current player from 'x' to 'o' to 'x'" do
        # Arrange
        game = Game.new
        game.next_player
        game.next_player
        #Assert
        expect(game.current_player).to eq('x')
      end 
    end 

end

