class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize



  protected

    def authorize
      unless User.find_by(email: session[:email])
        flash[:alert] = "Please log in."
        redirect_to login_url
      end
    end
end
