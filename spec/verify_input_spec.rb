require_relative "../verify_input"

context VerifyAndConvertInput do
    describe "#correct_format?" do
        it "when given a random string returns false" do 
          # Arrange
          move = "dakgfjelufhkbalekd"
          get_input = described_class.new
          # Act
          result = get_input.correct_format?(move)
          # Assert 
          expect(result).to eq(false)
        end
        it "when given a correctly formatted string returns true" do 
            # Arrange
            move = "2,2"
            get_input = described_class.new
            # Act
            result = get_input.correct_format?(move)
            # Assert 
            expect(result).to eq(true)
        end 
        it "when given another correctly formatted string returns true" do 
            # Arrange
            move = "0 2"
            get_input = described_class.new
            # Act
            result = get_input.correct_format?(move)
            # Assert 
            expect(result).to eq(true)
        end 
        it "when given another correctly formatted string returns true" do 
            # Arrange
            move = "1:2"
            get_input = described_class.new
            # Act
            result = get_input.correct_format?(move)
            # Assert 
            expect(result).to eq(true)
        end 
        it "when given two digit numbers, formatted correctly, string returns false" do 
          # Arrange
          move = "10,20"
          get_input = described_class.new
          # Act
          result = get_input.correct_format?(move)
          # Assert 
          expect(result).to eq(false)
        end 
        it "when given negative numbers, returns false" do 
          # Arrange
          move = "-1, -1"
          get_input = described_class.new
          # Act
          result = get_input.correct_format?(move)
          # Assert 
          expect(result).to eq(false)
        end 
      end 
      describe "#convert_move" do
        it "receives valid move and converts to array" do
          # Arrange  
          get_input = described_class.new
          move = "1,2"
          # Act
          result = get_input.convert_move(move)
          # Assert 
          expect(result).to eq([1,2])
        end
        it "receives valid move and converts to array" do
          # Arrange  
          get_input = described_class.new
          move = "0,5"
          # Act
          result = get_input.convert_move(move)
          # Assert 
          expect(result).to eq([0,5])
        end
        it "receives valid move and converts to array" do
          # Arrange  
          get_input = described_class.new
          move = "0,3"
          # Act
          result = get_input.convert_move(move)
          # Assert 
          expect(result).to eq([0,3])
        end
        it "receives valid move and converts to array" do
          # Arrange  
          get_input = described_class.new
          move = "0: 3"
          # Act
          result = get_input.convert_move(move)
          # Assert 
          expect(result).to eq([0,3])
        end
      end
      describe "#take_and_return_user_input" do
        it "returns a valid move given a valid string" do
          # Arrange  
          verify_input = described_class.new
          good_move = "2, 5"
          # Act
          result = verify_input.take_and_return_user_input(good_move)
          # Assert 
          expect(result).to eq([2,5])
        end
        it "returns a false given an invalid string" do
          # Arrange  
          verify_input = described_class.new
          good_move = "2, 50"
          # Act
          result = verify_input.take_and_return_user_input(good_move)
          # Assert 
          expect(result).to eq(false)
        end
      end
      describe "#out_of_grid?" do
        it "returns true if move is outside of grid" do
          # Arrange  
          verify_input = described_class.new
          bad_move = [2, 50]
          # Act
          result = verify_input.out_of_grid?(bad_move)
          # Assert 
          expect(result).to eq(true)
        end

        it "returns false if move is inside of grid" do
          # Arrange  
          verify_input = described_class.new
          good_move = [2, 2]
          # Act
          result = verify_input.out_of_grid?(good_move)
          # Assert 
          expect(result).to eq(false)
        end
      end
      describe "#space_taken?" do
        it "returns false if space is empty" do
          # Arrange  
          verify_input = described_class.new
          good_move = [2, 2]
          game_state = [['', '', ''],['', '', ''],['', '', '']]

          # Act
          result = verify_input.space_taken?(good_move,game_state)
          # Assert 
          expect(result).to eq(false)
        end

        it "returns true if space is taken" do
          # Arrange  
          verify_input = described_class.new
          bad_move = [2, 2]
          game_state = [['', '', ''],['', '', ''],['', '', 'x']]

          # Act
          result = verify_input.space_taken?(bad_move,game_state)
          # Assert 
          expect(result).to eq(true)
        end
      end

end