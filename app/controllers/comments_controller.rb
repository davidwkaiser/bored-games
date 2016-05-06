
  class CommentsController < ApplicationController
    def new
      @game = Game.find(params[:game_id])
      if current_user
        @comment = @game.comments.new(user_id: current_user.id, game_id: @game.id)
      else
        flash[:errors] = ["You must be logged in to comment!"]
        redirect_to game_path(@game)
      end
    end

    def create
      if current_user
        @game = Game.find(params[:game_id])
        @comment = @game.comments.new(comment_params)
        @comment.user = current_user

        if @comment.save
          flash[:notice] = ["Thank you for your comment!"]
          redirect_to @comment.game
        else
          flash[:errors] = @comment.errors.full_messages
          redirect_to new_game_comment_path(game_id: @game.id)
        end
      end
    end

    def comment_params
      params.require(:comment).permit(:user_id, :body, :game_id)
    end
  end
