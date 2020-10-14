class Game

  attr_accessor :game_state, :current_player, :verified_move
  
  def initialize
    @game_state = [['', '', ''],['', '', ''],['', '', '']]
    @current_player = 'x'
  end

  def add_move(row, col)
    return false if invalid_move?(row, col)
    @game_state[row][col] = @current_player
  end

  def invalid_move?(row,col)
    return true if row > 2 || col > 2
    return true if @game_state[row][col] == 'o' || @game_state[row][col] == 'x' 
    false
  end

  def next_player
    player_array = {'x' => 'o', 'o' => 'x'}
    @current_player = player_array[@current_player]
  end 

  def play_move
    add_move(@verified_move[0], @verified_move[1])
  end

  # def verify_and_format_move(move)
  #   verify = VerifyAndConvertInput.new
  #   @verified_move = verify.take_and_return_user_input(move)
  # end
end