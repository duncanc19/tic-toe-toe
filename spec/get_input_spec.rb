require_relative "../get_input"

context GetInput do
  describe "#get_move" do
    it "receives user move" do
      get_input = GetInput.new
      allow(get_input).to receive(:gets) {"0,2\n"}
      
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
        move = "0,2"
        get_input = GetInput.new
        # Act
        result = get_input.verify_move(move)
        # Assert 
        expect(result).to eq(true)
    end 
    it "when given another correctly formatted string returns true" do 
        # Arrange
        move = "1,2"
        get_input = GetInput.new
        # Act
        result = get_input.verify_move(move)
        # Assert 
        expect(result).to eq(true)
    end 
  end 
end