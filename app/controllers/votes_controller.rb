class VotesController < ApplicationController

	def create
		@game = Game.find_by(id: params[:voteable_id])
		if current_user.games.include?(@game)
			@vote = current_user.votes.new(voteable: @game)
			if @vote.save
				@game
			else
				redirect_to @game
			end
		else
			respond_to do |format|
				format.js { render 'error' }
				format.html  do
					flash[:error] = ["You can only vote on games in your library!"]
					redirect_to @game
				end
			end
		end
	end

end
