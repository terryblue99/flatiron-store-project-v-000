class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to user_path(current_user)
    else
      session[:sign_in] = "first"
      render 'new'
    end
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to store_path(@user)
      else
        redirect_to signin_path
      end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end

end
