class MechanicsController < ApplicationController

  def show
    @mechanic = Mechanic.find(params[:id])
    @games = @mechanic.games.paginate(:page => params[:page], :per_page => 10).order('name ASC')
    p @games
  end



end
