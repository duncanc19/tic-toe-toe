require_relative "../get_input"

context GetInput do
  describe "#get_move" do
    it "receives user move" do
      get_input = GetInput.new
      allow(get_input).to receive(:gets) {"0 2\n"}
      
      expect(get_input.get_move).to eq("0 2")    
    end
  end
end