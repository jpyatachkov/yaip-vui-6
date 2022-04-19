class ApplicationController < ActionController::Base
  before_action :require_login

  include SessionHelper

  private

  def require_login
    redirect_to session_login_path unless logged_in?
  end
end
