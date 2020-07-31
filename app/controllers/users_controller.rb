class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]

  # GET /users/profile
  def profile
    @landscapes = current_user.landscapes
  end
  # GET /users/1
  def show
    @landscapes = @user.landscapes
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
