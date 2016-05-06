
  class CommentsController < ApplicationController
    def new
      @game = Game.find(params[:game_id])
      p @game
      @comment = @game.comments.new(user_id: current_user.id, game_id: @game.id)
    end

    def create
      p params
      @game = Game.find(params[:game_id])
      @comment = @game.comments.new(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to @comment.game
      else
        redirect_to new_game_comment_path(game_id: @commment.game.id)
      end
    end

    def comment_params
      params.require(:comment).permit(:user_id, :body, :game_id)
    end
  end
