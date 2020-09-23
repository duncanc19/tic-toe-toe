class Game

  attr_accessor :game_state

  def initialize
    @game_state = [['','', ''],['','', ''],['','', '']]
  end

  def add_move(row, col)
    return false if row > 2 || col > 2
    return false if @game_state[row][col] == 'x' 
    @game_state[row][col] = 'x'
  end
end