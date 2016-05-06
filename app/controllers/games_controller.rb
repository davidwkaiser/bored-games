class GamesController < ApplicationController
  def index
    # @games = Game.all
    @games = Game.paginate(:page => params[:page], :per_page => 10)
    @mechanics = Mechanic.top_mechanics
    # if response.xhr?
    #   render plain: "OK"
    # else
    #   render :index
    # end
  end

  def show
    @game = Game.find(params[:id])
  end

  def names
    @games = Game.paginate(:page => params[:page], :per_page => 10).order('name ASC')
    @mechanics = Mechanic.top_mechanics
  end

  def popularity
    @games = Game.joins(:votes).group("games.id").order("count(games.id) DESC")
    @games = @games.paginate(:page => params[:page], :per_page => 10)
    @mechanics = Mechanic.top_mechanics
  end

  def mechanics
    @games = []
    params[:stuff].each do |id, value|
      if value.to_i > 0
        mechanic = Mechanic.find(id.to_i)
        @games << mechanic.games
      end
    end
    @games.uniq!
    @mechanics = Mechanic.top_mechanics
  end

  private

  def mech_params

  end
end
