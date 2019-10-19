class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :logged_in_user

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Пожалуйста, выполните вход в аккаунт"
      redirect_to login_url
    end
  end
end
