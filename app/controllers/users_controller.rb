class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @landscapes = current_user.landscapes
  end
end
