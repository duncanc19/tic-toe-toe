require_relative "../get_input"

context GetInput do
  describe "#get_move" do
    it "receives user move" do
      get_input = described_class.new
      allow(get_input).to receive(:gets) {"0,2\n"}
      
      expect(get_input.get_move).to eq("0,2")    
    end
    it "receives user move" do
      get_input = described_class.new
      allow(get_input).to receive(:gets) {"0,2 \n"}
      
      expect(get_input.get_move).to eq("0,2")    
    end
  end
  describe "#get_game_type" do
    it "receives game type = 1" do
      get_input = described_class.new
      allow(get_input).to receive(:gets) {"1\n"}
      
      expect(get_input.get_game_type).to eq("2-player game")    
    end

    it "receives game type = 2" do
      get_input = described_class.new
      allow(get_input).to receive(:gets) {"2\n"}
      
      expect(get_input.get_game_type).to eq("computer")    
    end

    it "receives game type 1 after repeated bad inputs" do
      get_input = described_class.new
      allow(get_input).to receive(:gets).and_return("hello\n")
      
      expect(get_input.get_game_type).to eq(false)    
    end
  end
end

