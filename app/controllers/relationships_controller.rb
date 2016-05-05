class RelationshipsController < ApplicationController
  def create
    sender_id = session[:user_id]
    @user = User.find(params[:user_id])
    receiver_id = @user.id
    @relationship = Relationship.new(sender_id: sender_id, receiver_id: receiver_id)
    if @relationship.save
      redirect_to @user #this should show without an "add friend button"
    else
      redirect_to @user #the target's original page
    end
  end

  private
  def relationship_params
    params.require(:relationship).permit(:receiver_id)
  end

end

