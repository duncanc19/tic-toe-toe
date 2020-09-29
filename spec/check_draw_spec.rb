require_relative "../check_draw"

context CheckDraw do
  describe "given an unfinished board" do
    it "returns false" do
      # Arrange
      game = Game.new
      # Act
      result = CheckDraw.check_draw(game)
      # Assert
      expect(result).to eq(false)
    end
  end    
end