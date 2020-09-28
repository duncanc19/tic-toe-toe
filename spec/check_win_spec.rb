require_relative "../check_win"

describe "given an unfinished game" do
    it "returns false" do
      # Arrange
      game = Game.new
      # Act
      result = CheckWin.check_rows(game) 
      # Assert  
      expect(result).to eq(false)  
    end
end