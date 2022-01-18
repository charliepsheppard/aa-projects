class Api::UsersController < ApplicationController

  def create
    @user = User.new(params)
  end

end
