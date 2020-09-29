require_relative "../get_input"

context GetInput do
  describe "#get_move" do
    it "receives user move" do
      get_input = GetInput.new
      allow(get_input).to receive(:gets) {"0,2\n"}
      
      expect(get_input.get_move).to eq("0,2")    
    end
    it "receives user move" do
      get_input = GetInput.new
      allow(get_input).to receive(:gets) {"0,2 \n"}
      
      expect(get_input.get_move).to eq("0,2")    
    end
  end
  describe "#verify_move" do
    it "when given a random string returns false" do 
      # Arrange
      move = "dakgfjelufhkbalekd"
      get_input = GetInput.new
      # Act
      result = get_input.verify_move(move)
      # Assert 
      expect(result).to eq(false)
    end
    it "when given a correctly formatted string returns true" do 
        # Arrange
        move = "2,2"
        get_input = GetInput.new
        # Act
        result = get_input.verify_move(move)
        # Assert 
        expect(result).to eq(true)
    end 
    it "when given another correctly formatted string returns true" do 
        # Arrange
        move = "0 2"
        get_input = GetInput.new
        # Act
        result = get_input.verify_move(move)
        # Assert 
        expect(result).to eq(true)
    end 
    it "when given another correctly formatted string returns true" do 
        # Arrange
        move = "1:2"
        get_input = GetInput.new
        # Act
        result = get_input.verify_move(move)
        # Assert 
        expect(result).to eq(true)
    end 
    it "when given two digit numbers, formatted correctly, string returns false" do 
      # Arrange
      move = "10,20"
      get_input = GetInput.new
      # Act
      result = get_input.verify_move(move)
      # Assert 
      expect(result).to eq(false)
    end 
  end 
  describe "#convert_move" do
    it "receives valid move and converts to array" do
      # Arrange  
      get_input = GetInput.new
      move = "1,2"
      # Act
      result = get_input.convert_move(move)
      # Assert 
      expect(result).to eq([1,2])
    end
    it "receives valid move and converts to array" do
      # Arrange  
      get_input = GetInput.new
      move = "0,5"
      # Act
      result = get_input.convert_move(move)
      # Assert 
      expect(result).to eq([0,5])
    end
    it "receives valid move and converts to array" do
      # Arrange  
      get_input = GetInput.new
      move = "0,3"
      # Act
      result = get_input.convert_move(move)
      # Assert 
      expect(result).to eq([0,3])
    end
    it "receives valid move and converts to array" do
      # Arrange  
      get_input = GetInput.new
      move = "0: 3"
      # Act
      result = get_input.convert_move(move)
      # Assert 
      expect(result).to eq([0,3])
    end
  end
  describe "#take_and_return_user_input" do
    it "returns a valid move" do
      # Arrange  
      get_input = GetInput.new
      allow(get_input).to receive(:gets) {"0,2"}
      # Act
      result = get_input.take_and_return_user_input
      # Assert 
      expect(result).to eq([0,2])
    end
    it "returns a valid move" do
        # Arrange  
        get_input = GetInput.new
        allow(get_input).to receive(:gets) {"0 , 1"}
        # Act
        result = get_input.take_and_return_user_input
        # Assert 
        expect(result).to eq([0,1])
      end
  end
end