class FollowsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    render json: { success: "Success follow user" }, status: 200
  end

  def destroy
    user = User.find(params[:id])
    current_user.unfollow(user)
    render json: { success: "Success unfollow user" }, status: 200
  end
end
