class BaseController < ApplicationController
  def index
    if user_signed_in?
      @test = 'test'
    else
      redirect_to new_user_session_path
    end
  end
end