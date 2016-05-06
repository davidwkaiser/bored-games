class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:user_id])
    if current_user && !current_user.friend_requests.include?(user)
      relationship = current_user.sent_relationships.new(receiver: user)
      if relationship.save
        redirect_to user
      else
        flash[:errors] = ["Already sent request!"]
        redirect_to user #the target's original page
      end
    else
      flash[:errors] = ["Request already exists in your inbox."]
      redirect_to user #the target's original page
    end
  end

  def update
    rel = current_user.received_relationships.find(params[:id])
    rel.status = true
    rel.save
    flash[:notice] = ["New friend added!"]
    redirect_to current_user
  end

  private
  def relationship_params
    params.require(:user).permit(:other_id)
  end

  def info_params
    params.require(:info).permit(:sender_id, :receiver_id, :status)
  end
end
