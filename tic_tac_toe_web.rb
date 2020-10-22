require 'sinatra'

  enable :sessions

  get '/' do
    @grid_array = fill_grid
    session[:grid_array] = @grid_array
    erb :index
  end

  post '/move' do
    @grid_array = fill_grid(@params)
    session[:grid_array] = @grid_array
    erb :index
  end


  def fill_grid(params = [])
    grid_array = [["","",""],["","",""],["","",""]]
    params.each do |box, move|
      row = box.match(/(\d)(\d)/)[1]
      col = box.match(/(\d)(\d)/)[2]
      grid_array[row.to_i][col.to_i] = move
    end
    return grid_array
  end

