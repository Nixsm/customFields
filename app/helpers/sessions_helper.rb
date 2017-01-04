module SessionsHelper

  def log_in(user)
    session[:user_id] = user.__id__
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
