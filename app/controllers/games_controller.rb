class GamesController < ApplicationController

  def index
    # @games = Game.all
    @games = Game.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @game = Game.find(params[:id])
  end

  def names
    @games = Game.paginate(:page => params[:page], :per_page => 10).order('name ASC')
  end

  def popularity
    @games = Game.paginate(:page => params[:page], :per_page => 10).order(votes.count)
  end



end
