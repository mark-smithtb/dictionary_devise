class UsersController < ApplicationController

def show
end

def new
  @user= User.new
end

def create
  @user = User.create(user_params)
  redirect_to root_path, notice: 'Your account has been created.'
end

  private
  def user_params
    params.permit(:first_name, :last_name, :email, :password)
  end

end
