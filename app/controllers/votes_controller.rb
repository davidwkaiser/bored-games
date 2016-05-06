class VotesController < ApplicationController

	def create
		@game = Game.find_by(id: params[:voteable_id])
		if current_user.games.include?(@game)
			@vote = current_user.votes.new(voteable: @game)
			if @vote.save
				respond_to do |format|
					format.js { @game }
					format.html do 
						flash[:notice] = ["Point added!"]
						redirect_to @game
					end
				end
			else
				flash[:errors] = ["Something went wrong.", "Make sure you're logged in and this game is in your library."]
				redirect_to @game
			end
		else
			respond_to do |format|
				format.js { render 'error' }
				format.html do
					flash[:errors] = ["Something went wrong.", "Make sure you're logged in and this game is in your library."]
					redirect_to @game
				end
			end
		end
	end

end
