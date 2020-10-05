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

    describe "#play_move" do
    it "returns false when move is out of bounds" do
        # Arrange
        game_controller = GameController.new
        game_controller.verified_move = [0,5]
         # Act
        result = game_controller.play_move
        # Assert  
        expect(result).to eq(false)
      end
    #   it "updates game.game_state when move is in empty square" do
    #     # Arrange
    #     game_controller = GameController.new
    #     game_controller.verified_move = [0,2]
    #     expected_gamestate = [['','', 'x'],['','', ''],['','', '']]
    #     # Act
    #     result = game_controller.play_move
    #     # Assert  
    #     expect(game_controller.game.game_state).to eq(expected_gamestate)
    #   end
    end
end