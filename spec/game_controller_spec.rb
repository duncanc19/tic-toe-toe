require_relative "../game_controller"

context GameController do
    describe "#receive_move" do
      it "returns false when given empty string" do
        # Arrange
        game_controller = GameController.new
        # Act
        allow(game_controller.input).to receive(:gets) {"\n"}
        result = game_controller.receive_move
        # Assert  
        expect(result).to eq(false)  
      end
      it "returns array when given valid move" do
        # Arrange
        game_controller = GameController.new
        # Act
        allow(game_controller.input).to receive(:gets) {"0,2\n"}
        result = game_controller.receive_move
        # Assert  
        expect(result).to eq([0,2])  
      end
    end
end