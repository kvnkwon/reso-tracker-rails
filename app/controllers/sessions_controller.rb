class SessionsController < ApplicationController

  def welcome #the index
  end

  def new #get sign in form
  end

  def create #the actual action of sign in
    @user = User.find_by(name: params[:session][:name])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
