class Game

  attr_accessor :game_state

  def initialize
    @game_state = [['','', ''],['','', ''],['','', '']]
  end

  def add_move(row, col)
    return false if row > 2
    @game_state[row][col] = 'x'
  end
end