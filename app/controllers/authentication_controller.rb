 # app/controllers/authentication_controller.rb
class AuthenticationController < ApplicationController
    def new
      # Render login form
    end
  
    def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        render :new, alert: 'Invalid email or password'
      end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully'
    end
  end  