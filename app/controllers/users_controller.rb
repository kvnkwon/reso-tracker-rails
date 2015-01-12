class UsersController < ApplicationController
  def new #get
    @user = User.new
  end

  def create #post
    @user = User.new(user_params)
     if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit #gets the edit
  end

  def update #patches the edit
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :full_name, :password, :password_confirmation)
  end

end
