class GamesController < ApplicationController

  def index
    # @games = Game.all
    @games = Game.paginate(:page => params[:page], :per_page => 10)
    respond_to do |format|
      format.html
      format.js { render 'comments/comment', layout: false, locals: { comment: Comment.new } }
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def names
    @games = Game.paginate(:page => params[:page], :per_page => 10).order('name ASC')
  end

  # def popularity
  #   @games = Game.paginate(:page => params[:page], :per_page => 10).order(self.votes.count)
  # end

  def popularity
    @games = Game.joins(:votes).group("games.id").order("count(games.id) DESC")
    @games = @games.paginate(:page => params[:page], :per_page => 10)

  end




end
