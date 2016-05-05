class AdditionsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    current_user.games << game
    redirect_to game_path(game)
  end

  def destroy
    game = Game.find(params[:id])
    addition = current_user.additions.find_by(game_id: game.id)
    addition.destroy
    redirect_to game_path(game)
  end
end
