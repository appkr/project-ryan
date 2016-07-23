class RendingController < ApplicationController
  def index
    @following_users = current_user.following
  end
end
