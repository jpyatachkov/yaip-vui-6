class SessionController < ApplicationController
  skip_before_action :require_login, only: [:login, :create]

  def login; end

  def create
    # Идентификация.
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      log_in user
      redirect_to root_path
    else
      redirect_to session_login_path
    end
  end

  def logout
    log_out
    redirect_to session_login_path
  end
end
