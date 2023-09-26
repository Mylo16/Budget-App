class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @users = User.all
  end
end
