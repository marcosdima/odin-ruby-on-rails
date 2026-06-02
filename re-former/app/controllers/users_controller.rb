class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      render :new
    else
      render :new, status: :unprocessable_entity
    end
  end

  def user_params
    params.expect(user: [:username, :email, :password])
  end
end
