class VotesController < ApplicationController

	def create
		@game = Game.find_by(id: params[:voteable_id])
		if current_user.games.include?(@game)
			@vote = current_user.votes.new(voteable: @game)
			if @vote.save
				flash[:notice] = ["Point added!"]
				redirect_to @game
			else
				flash[:errors] = ["Something went wrong.", "Make sure you're logged in and this game is in your library."]
				redirect_to @game
			end
		else
			flash[:errors] = ["Something went wrong.", "Make sure you're logged in and this game is in your library."]
			redirect_to @game
		end
	end

end