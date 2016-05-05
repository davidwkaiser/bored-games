class VotesController < ApplicationController

	def create
		@game = Game.find_by(id: params[:voteable_id])
		if current_user.games.include?(@game)
			@vote = current_user.votes.new(voteable: @game)
			if @vote.save
				redirect_to @game
			else
				redirect_to @game
			end
		else
			redirect_to @game
		end
	end

end