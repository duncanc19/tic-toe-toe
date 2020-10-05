require_relative "../game_controller"

context GameController do
    describe "#receive_move" do
      it "returns nil when given empty string" do
        # Arrange
        game_controller = GameController.new
        # Act
        result = game_controller.receive_move 
        # Assert  
        expect(result).to eq(false)  
      end
    end
end