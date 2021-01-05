class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @users = User.all
  end
end