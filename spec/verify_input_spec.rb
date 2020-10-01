require_relative "../verify_input"

context VerifyAndConvertInput do
    describe "#verify_move?" do
        it "when given a random string returns false" do 
          # Arrange
          move = "dakgfjelufhkbalekd"
          get_input = described_class.new
          # Act
          result = get_input.verify_move?(move)
          # Assert 
          expect(result).to eq(false)
        end
        it "when given a correctly formatted string returns true" do 
            # Arrange
            move = "2,2"
            get_input = described_class.new
            # Act
            result = get_input.verify_move?(move)
            # Assert 
            expect(result).to eq(true)
        end 
        it "when given another correctly formatted string returns true" do 
            # Arrange
            move = "0 2"
            get_input = described_class.new
            # Act
            result = get_input.verify_move?(move)
            # Assert 
            expect(result).to eq(true)
        end 
        it "when given another correctly formatted string returns true" do 
            # Arrange
            move = "1:2"
            get_input = described_class.new
            # Act
            result = get_input.verify_move?(move)
            # Assert 
            expect(result).to eq(true)
        end 
        it "when given two digit numbers, formatted correctly, string returns false" do 
          # Arrange
          move = "10,20"
          get_input = described_class.new
          # Act
          result = get_input.verify_move?(move)
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
end