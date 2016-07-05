class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user == nil
      flash[:alert] = 'Invalid email/password combination'
      render 'new'
    else
      if user[:password] == params[:password]
        reset_session
        session[:email] = user.email
        redirect_to users_url
      else
        flash[:alert] = 'Invalid email/password combination'
        render 'new'
      end
    end

  end

  def destroy
    reset_session
    redirect_to login_url
  end
end
