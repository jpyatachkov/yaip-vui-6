class UserController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new; end

  def create
    user = User.create params.permit(:login, :password, :password_confirmation)
    log_in user
    redirect_to root_path
  end
end
